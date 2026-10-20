import 'dart:math' as math;

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/dto/pactl_module_dto.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/dto/pw_object_dto.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/graph_snapshot.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/node_owner.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_device.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_link.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_module.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_node_type.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_port.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_profile.dart';

typedef _Mixer = ({double volume, bool mute});

/// Maps the raw `pw-dump` objects (+ `pactl` modules) to the domain snapshot.
///
/// Volume/mute follow WirePlumber's mixer API, i.e. what `wpctl` shows:
/// - device nodes (`device.id` + `card.profile.device`): the device's Route
///   param whose `device` equals the node's `card.profile.device`;
/// - all other nodes: the node's Props param;
/// - value = first entry of `channelVolumes` (linear) in cubic scale (cbrt);
/// - neither carries `channelVolumes`: the node has no volume (`hasVolume` false).
///
/// Creation arguments (e.g. `rate=48000` of `pactl load-module`) are not in
/// `pw-dump`: they come from pactl, matched via the node's `pulse.module.id`.
abstract final class PwGraphTransformer {
  static GraphSnapshot toSnapshot(List<PwObjectDto> objects, List<PactlModuleDto> modules) {
    final devicesById = <int, PwObjectDto>{
      for (final o in objects)
        if (o.type == PwObjectType.device) o.id: o,
    };
    final clientsById = <int, PwObjectDto>{
      for (final o in objects)
        if (o.type == PwObjectType.client) o.id: o,
    };
    final modulesByIndex = <int, PwModule>{for (final m in modules) m.index: _module(m)};
    final metadata = _metadata(objects);

    return GraphSnapshot(
      nodes: objects
          .where((o) => o.type == PwObjectType.node)
          .map((o) => _node(o, devicesById, clientsById, modulesByIndex))
          .toIList(),
      devices: objects.where((o) => o.type == PwObjectType.device).map(_device).toIList(),
      ports: objects.where((o) => o.type == PwObjectType.port).map(_port).nonNulls.toIList(),
      links: objects.where((o) => o.type == PwObjectType.link).map(_link).nonNulls.toIList(),
      defaultSinkName: metadata.sink,
      defaultSourceName: metadata.source,
      clock: metadata.clock,
    );
  }

  // ---------------------------------------------------------------- objects

  static PwNode _node(
    PwObjectDto o,
    Map<int, PwObjectDto> devicesById,
    Map<int, PwObjectDto> clientsById,
    Map<int, PwModule> modulesByIndex,
  ) {
    final props = _props(o.info);
    final deviceId = _int(props['device.id']);
    final module = modulesByIndex[_int(props['pulse.module.id'])];
    final mixer = _routeMixer(devicesById[deviceId], _int(props['card.profile.device'])) ?? _nodeMixer(o.info);

    return PwNode(
      id: o.id,
      name: _string(props['node.name']) ?? '',
      description:
          _string(props['node.description']) ??
          _string(props['node.nick']) ??
          _string(props['application.name']) ??
          _string(props['node.name']) ??
          '${o.id}',
      mediaClass: _string(props['media.class']) ?? '',
      type: _nodeType(_string(props['media.class'])),
      deviceId: deviceId,
      volume: mixer?.volume ?? 1.0,
      mute: mixer?.mute ?? false,
      hasVolume: mixer != null,
      rate: _int(_params(o.info, 'Format').firstOrNull?['rate']),
      module: module,
      owner: _owner(module, _int(props['client.id']), clientsById),
      linkGroup: _string(props['node.link-group']),
      driverId: _int(props['node.driver-id']),
      resampleDisabled: props['resample.disable'] == true,
    );
  }

  /// Removable owner of a node: its pactl module, else its client when that is a `pw-loopback`
  /// process (`application.process.binary` of the Client object, `client.id` of the node).
  /// Any other client (apps, WirePlumber) is not an owner the GUI may destroy.
  static NodeOwner? _owner(PwModule? module, int? clientId, Map<int, PwObjectDto> clientsById) {
    final client = _props(clientsById[clientId]?.info);
    if (module != null) {
      return NodeOwner.module(module);
    }
    if (clientId != null && client['application.process.binary'] == 'pw-loopback') {
      return NodeOwner.loopbackProcess(clientId: clientId, processId: _int(client['application.process.id']));
    }
    return null;
  }

  static PwNodeType _nodeType(String? mediaClass) => switch (mediaClass) {
    'Audio/Sink' => PwNodeType.audioSink,
    'Audio/Source' || 'Audio/Source/Virtual' => PwNodeType.audioSource,
    'Audio/Duplex' => PwNodeType.audioDuplex,
    'Stream/Output/Audio' => PwNodeType.audioStreamOutput,
    'Stream/Input/Audio' => PwNodeType.audioStreamInput,
    'Midi/Bridge' => PwNodeType.midiBridge,
    final String c when c.startsWith('Video/') || c.endsWith('/Video') => PwNodeType.video,
    _ => PwNodeType.other,
  };

  static PwDevice _device(PwObjectDto o) {
    final props = _props(o.info);
    final active = _params(o.info, 'Profile');

    return PwDevice(
      id: o.id,
      name: _string(props['device.name']) ?? '',
      description: _string(props['device.description']) ?? _string(props['device.nick']) ?? _string(props['device.name']) ?? '${o.id}',
      profiles: _params(o.info, 'EnumProfile').map(_profile).nonNulls.toIList(),
      activeProfileIndex: active.isNotEmpty ? _int(active.first['index']) : null,
    );
  }

  /// EnumProfile entry. `available` is "yes" / "no" / "unknown":
  /// only "no" means not usable.
  static PwProfile? _profile(Map<String, dynamic> profile) {
    final index = _int(profile['index']);
    if (index != null) {
      return PwProfile(
        index: index,
        name: _string(profile['name']) ?? '',
        description: _string(profile['description']) ?? _string(profile['name']) ?? '',
        available: profile['available'] != 'no',
      );
    }
    return null;
  }

  static PwPort? _port(PwObjectDto o) {
    final props = _props(o.info);
    final nodeId = _int(props['node.id']);
    if (nodeId != null) {
      return PwPort(
        id: o.id,
        nodeId: nodeId,
        name: _string(props['port.name']) ?? '${o.id}',
        direction: o.info?['direction'] == 'input' ? PortDirection.input : PortDirection.output,
        index: _int(props['port.id']) ?? 0,
        mediaType: _mediaType(_string(props['format.dsp'])),
        channel: _string(props['audio.channel']),
      );
    }
    return null;
  }

  /// `format.dsp`: "32 bit float mono audio", "8 bit raw midi",
  /// "32 bit raw UMP" (MIDI 2.0), "32 bit float RGBA video".
  static PortMediaType _mediaType(String? formatDsp) => switch (formatDsp) {
    final String f when f.endsWith('audio') => PortMediaType.audio,
    final String f when f.endsWith('midi') || f.endsWith('UMP') => PortMediaType.midi,
    final String f when f.endsWith('video') => PortMediaType.video,
    _ => PortMediaType.other,
  };

  /// Link state: error, unlinked, init, negotiating, allocating, paused, active.
  static PwLink? _link(PwObjectDto o) {
    if (o.info case {
      'output-node-id': final int outputNodeId,
      'output-port-id': final int outputPortId,
      'input-node-id': final int inputNodeId,
      'input-port-id': final int inputPortId,
    }) {
      return PwLink(
        id: o.id,
        outputNodeId: outputNodeId,
        outputPortId: outputPortId,
        inputNodeId: inputNodeId,
        inputPortId: inputPortId,
        active: o.info?['state'] == 'active',
      );
    }
    return null;
  }

  static PwModule _module(PactlModuleDto dto) => PwModule(index: dto.index, name: dto.name, arguments: _moduleArguments(dto.argument));

  // --------------------------------------------------------------- metadata

  /// Subject 0 entries of:
  /// - `default`: `default.audio.sink` / `default.audio.source`
  ///   → `{"name": "<node.name>"}`;
  /// - `settings`: `clock.*` → int (pw-dump prints them as numbers or strings),
  ///   `clock.allowed-rates` → `"[ 44100, 48000 ]"`. 0 for force-* means automatic.
  static ({String? sink, String? source, ClockSettings clock}) _metadata(List<PwObjectDto> objects) {
    String? sink;
    String? source;
    var clock = const ClockSettings();
    for (final o in objects) {
      if (o.type == PwObjectType.metadata) {
        final metadataName = o.props?['metadata.name'];
        for (final entry in o.metadata ?? const <Map<String, dynamic>>[]) {
          if (entry['subject'] == 0) {
            switch ((metadataName, entry['key'])) {
              case ('default', 'default.audio.sink'):
                sink = _metadataName(entry['value']);
              case ('default', 'default.audio.source'):
                source = _metadataName(entry['value']);
              case ('settings', 'clock.rate'):
                clock = clock.copyWith(rate: _positive(entry['value']));
              case ('settings', 'clock.allowed-rates'):
                clock = clock.copyWith(allowedRates: _integers(entry['value']));
              case ('settings', 'clock.force-rate'):
                clock = clock.copyWith(forceRate: _positive(entry['value']));
              case ('settings', 'clock.quantum'):
                clock = clock.copyWith(quantum: _positive(entry['value']));
              case ('settings', 'clock.min-quantum'):
                clock = clock.copyWith(minQuantum: _positive(entry['value']));
              case ('settings', 'clock.max-quantum'):
                clock = clock.copyWith(maxQuantum: _positive(entry['value']));
              case ('settings', 'clock.force-quantum'):
                clock = clock.copyWith(forceQuantum: _positive(entry['value']));
            }
          }
        }
      }
    }
    return (sink: sink, source: source, clock: clock);
  }

  /// Settings value > 0, null for 0 (automatic / default) or missing.
  static int? _positive(Object? value) {
    final number = _int(value);
    if (number != null && number > 0) {
      return number;
    }
    return null;
  }

  static final _integerPattern = RegExp(r'\d+');

  /// Every integer in a JSON-ish array: `"[ 44100, 48000 ]"` or an already decoded list.
  static IList<int> _integers(Object? value) => _integerPattern
      .allMatches(value is List<dynamic> ? value.join(' ') : '$value')
      .map((match) => int.parse(match[0]!))
      .toIList();

  static String? _metadataName(Object? value) {
    if (value case {'name': final String name}) {
      return name;
    }
    return null;
  }

  // -------------------------------------------------------- module arguments

  /// `key=value` pairs separated by whitespace, as parsed by pa_modargs:
  /// a value is quoted only when it *starts* with `"` or `'`, so
  /// `source_properties=device.description="X"` keeps its inner quotes.
  static final _argumentPattern = RegExp(r'''([^\s=]+)=("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|(?:\\.|[^\s\\])*)''');

  static final _escapePattern = RegExp(r'\\(.)');

  static IMap<String, String> _moduleArguments(String argument) =>
      {for (final match in _argumentPattern.allMatches(argument)) match[1]!: _unquote(match[2]!)}.lock;

  static String _unquote(String value) {
    final quoted = value.length >= 2 && ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'")));
    final inner = quoted ? value.substring(1, value.length - 1) : value;
    return inner.replaceAllMapped(_escapePattern, (m) => m[1]!);
  }

  // ------------------------------------------------------------ volume/mute

  /// Device nodes: Route of [device] for the node's `card.profile.device`.
  static _Mixer? _routeMixer(PwObjectDto? device, int? profileDevice) {
    if (device != null && profileDevice != null) {
      for (final route in _params(device.info, 'Route')) {
        final mixer = _mixer(_map(route['props']));
        if (_int(route['device']) == profileDevice && mixer != null) {
          return mixer;
        }
      }
    }
    return null;
  }

  /// Other nodes: first Props param that carries `channelVolumes`
  /// (ALSA nodes have a second Props entry with device settings only).
  static _Mixer? _nodeMixer(Map<String, dynamic>? info) {
    for (final props in _params(info, 'Props')) {
      final mixer = _mixer(props);
      if (mixer != null) {
        return mixer;
      }
    }
    return null;
  }

  static _Mixer? _mixer(Map<String, dynamic>? props) {
    final channels = props?['channelVolumes'];
    if (props != null && channels is List<dynamic>) {
      final linear = _double(channels.isNotEmpty ? channels.first : props['volume']);
      return (volume: _cubic(linear ?? 1.0), mute: props['mute'] == true);
    }
    return null;
  }

  /// Linear → cubic scale (wpctl). Inverse on write: wpctl does `v * v * v`.
  static double _cubic(double linear) {
    if (linear > 0) {
      return math.pow(linear, 1 / 3).toDouble();
    }
    return 0;
  }

  // ---------------------------------------------------------------- helpers

  static Map<String, dynamic> _props(Map<String, dynamic>? info) => _map(info?['props']) ?? const {};

  /// `info.params[name]`: list of param objects, empty if absent.
  static Iterable<Map<String, dynamic>> _params(Map<String, dynamic>? info, String name) {
    final params = _map(info?['params'])?[name];
    if (params is List<dynamic>) {
      return params.whereType<Map<String, dynamic>>();
    }
    return const [];
  }

  static Map<String, dynamic>? _map(Object? value) => value is Map<String, dynamic> ? value : null;

  static int? _int(Object? value) => switch (value) {
    int v => v,
    num v => v.toInt(),
    String v => int.tryParse(v),
    _ => null,
  };

  static double? _double(Object? value) => value is num ? value.toDouble() : null;

  static String? _string(Object? value) => value is String && value.isNotEmpty ? value : null;
}
