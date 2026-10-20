/// A virtual node to create with `pactl load-module` (pipewire-pulse modules).
///
/// Arguments follow pipewire-pulse's parser (module_args_add_props): `key=value` separated by
/// spaces, a value quoted only when it starts with `"` or `'`, `\` escapes the next character.
/// Node properties (`sink_properties` / `source_properties`) are a second `key=value` list
/// quoted inside that value: `sink_properties='device.description="Virtual Sink"'`.
/// Each argument is passed to pactl as its own argv entry, no shell involved.
sealed class VirtualNodeSpec {
  const VirtualNodeSpec({
    required this.name,
    required this.channelMap,
    this.description = '',
    this.rate,
    this.resampleDisable = false,
    this.extraProperties = '',
  });

  /// `node.name` (letters, digits, `_ . -`).
  final String name;

  /// `device.description`, the label shown everywhere; empty → [name].
  final String description;

  /// Channel positions in pulse names (`front-left`, `aux0`, ...); channels = its length.
  final List<String> channelMap;

  /// Explicit sample rate; null → the node follows the graph rate.
  final int? rate;

  /// `resample.disable`: the node never resamples, it always runs at the graph rate.
  /// Not together with [rate]: a fixed rate that cannot be converted fails to start as soon as
  /// the graph runs at another rate.
  final bool resampleDisable;

  /// More node properties, `key=value` separated by spaces, passed as they are.
  final String extraProperties;

  /// pipewire-pulse module name.
  String get moduleName;

  /// Module arguments, one per entry.
  List<String> get moduleArguments;

  /// `channels` + `channel_map`: always consistent, the count comes from the map.
  List<String> get _channelArguments => ['channels=${channelMap.length}', 'channel_map=${channelMap.join(',')}'];

  /// Node properties as one quoted module argument value. [audioRate] goes in as `audio.rate`
  /// for the modules that accept `rate=` but do not apply it (remap-sink / remap-source).
  String _properties({int? audioRate}) => _quoted([
    'device.description=${_quoted(description.isEmpty ? name : description, '"')}',
    if (audioRate != null) 'audio.rate=$audioRate',
    if (resampleDisable) 'resample.disable=true',
    if (extraProperties.trim().isNotEmpty) extraProperties.trim(),
  ].join(' '), "'");
}

/// `module-null-sink`: a sink with no device behind it; what plays into it comes out of its
/// monitor ports.
final class NullSinkSpec extends VirtualNodeSpec {
  const NullSinkSpec({
    required super.name,
    required super.channelMap,
    super.description,
    super.rate,
    super.resampleDisable,
    super.extraProperties,
  });

  @override
  String get moduleName => 'module-null-sink';

  @override
  List<String> get moduleArguments => [
    'sink_name=$name',
    'sink_properties=${_properties()}',
    ..._channelArguments,
    if (rate case final int explicit) 'rate=$explicit',
  ];
}

/// `module-remap-sink`: a virtual sink forwarding to an output through a loopback. Its output
/// stream (`output.<name>`) is `node.passive` (module default): when nothing plays into the sink
/// the device is not kept busy, so it can change rate.
final class LoopbackSinkSpec extends VirtualNodeSpec {
  const LoopbackSinkSpec({
    required super.name,
    required super.channelMap,
    super.description,
    super.rate,
    super.resampleDisable,
    super.extraProperties,
    this.output,
    this.outputChannelMap,
    this.remix = true,
  });

  /// `node.name` of the sink to play into; null → the default sink (follows it when it changes).
  final String? output;

  /// Channel positions of the output stream; null → same as [channelMap]. Same channel count.
  final List<String>? outputChannelMap;

  /// Up/down-mix between the two channel maps when they differ.
  final bool remix;

  @override
  String get moduleName => 'module-remap-sink';

  @override
  List<String> get moduleArguments => [
    'sink_name=$name',
    'sink_properties=${_properties(audioRate: rate)}',
    if (output case final String sink) _argument('master', sink),
    ..._channelArguments,
    if (outputChannelMap case final List<String> map) 'master_channel_map=${map.join(',')}',
    if (!remix) 'remix=no',
  ];
}

/// `module-remap-source`: a virtual source recording from a source or from a sink monitor
/// (`<sink name>.monitor`). Its capture stream (`input.<name>`) is `node.passive` (module default).
final class CaptureSpec extends VirtualNodeSpec {
  const CaptureSpec({
    required super.name,
    required super.channelMap,
    super.description,
    super.rate,
    super.resampleDisable,
    super.extraProperties,
    this.input,
    this.inputChannelMap,
    this.remix = true,
  });

  /// `node.name` of the source, or `<sink name>.monitor`; null → the default source.
  final String? input;

  /// Channel positions of the capture stream; null → same as [channelMap]. Same channel count.
  final List<String>? inputChannelMap;

  /// Up/down-mix between the two channel maps when they differ.
  final bool remix;

  @override
  String get moduleName => 'module-remap-source';

  @override
  List<String> get moduleArguments => [
    'source_name=$name',
    'source_properties=${_properties(audioRate: rate)}',
    if (input case final String source) _argument('master', source),
    ..._channelArguments,
    if (inputChannelMap case final List<String> map) 'master_channel_map=${map.join(',')}',
    if (!remix) 'remix=no',
  ];
}

/// `key=value`, the value quoted only when the parser would split it.
String _argument(String key, String value) {
  if (value.contains(RegExp(r'''[\s"'\\]'''))) {
    return '$key=${_quoted(value, '"')}';
  }
  return '$key=$value';
}

/// [value] between [quote]s, with `\` and [quote] escaped by a backslash.
String _quoted(String value, String quote) => '$quote${value.replaceAll(r'\', r'\\').replaceAll(quote, '\\$quote')}$quote';
