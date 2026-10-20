import 'package:flutter/material.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';
import 'package:pipewire_gui/core/widgets/console_widgets.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/virtual_node_spec.dart';

/// A node to pick in a dropdown: `node.name` (what the module wants) and the label to show.
typedef NodeOption = ({String name, String label});

typedef _ChannelPreset = ({String label, List<String> positions});

enum _Kind { nullSink, loopbackSink, capture }

/// Modal to create a virtual node with `pactl load-module`: null sink, loopback sink
/// (module-remap-sink, passive output) or capture (module-remap-source).
/// Pops the [VirtualNodeSpec] on Create, null on Cancel. The exact command is previewed live.
class CreateNodeDialog extends StatefulWidget {
  const CreateNodeDialog({super.key, required this.sinks, required this.sources, required this.takenNames});

  /// Outputs for the loopback sink.
  final List<NodeOption> sinks;

  /// Inputs for the capture: sources and sink monitors (`<sink>.monitor`).
  final List<NodeOption> sources;

  /// `node.name` already in use.
  final Set<String> takenNames;

  @override
  State<CreateNodeDialog> createState() => _CreateNodeDialogState();
}

class _CreateNodeDialogState extends State<CreateNodeDialog> {
  static const _rates = [44100, 48000, 88200, 96000, 176400, 192000];

  static const List<_ChannelPreset> _presets = [
    (label: 'Mono', positions: ['mono']),
    (label: 'Stereo', positions: ['front-left', 'front-right']),
    (label: 'AUX 2', positions: ['aux0', 'aux1']),
    (label: 'AUX 4', positions: ['aux0', 'aux1', 'aux2', 'aux3']),
    (label: '5.1', positions: ['front-left', 'front-right', 'front-center', 'lfe', 'rear-left', 'rear-right']),
    (
      label: '7.1',
      positions: ['front-left', 'front-right', 'front-center', 'lfe', 'rear-left', 'rear-right', 'side-left', 'side-right'],
    ),
  ];

  static final _namePattern = RegExp(r'^[A-Za-z0-9_.\-]+$');

  /// Pulse channel position names (pipewire-pulse format.c).
  static final _positionPattern = RegExp(
    r'^(mono|lfe|(front|rear)-(left|right|center)|side-(left|right)|front-(left|right)-of-center'
    r'|top-center|top-(front|rear)-(left|right|center)|aux([0-9]|[1-5][0-9]|6[0-3]))$',
  );

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _customChannels = TextEditingController();
  final _extraProperties = TextEditingController();

  _Kind _kind = _Kind.nullSink;

  /// Null → custom positions typed in [_customChannels].
  _ChannelPreset? _channels = _presets[1];

  /// Output (loopback sink) or input (capture); null → default sink / source.
  String? _target;

  /// Channel map of the output / capture stream; null → same as the node.
  _ChannelPreset? _targetChannels;

  bool _remix = true;
  int? _rate;
  bool _resampleDisable = false;

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _customChannels.dispose();
    _extraProperties.dispose();
    super.dispose();
  }

  List<String> get _channelMap =>
      _channels?.positions ?? [for (final position in _customChannels.text.split(',')) if (position.trim().isNotEmpty) position.trim()];

  /// Presets with the node's channel count: the module requires the same count on both sides.
  List<_ChannelPreset> get _targetPresets => [
    for (final preset in _presets)
      if (preset.positions.length == _channelMap.length) preset,
  ];

  /// [_targetChannels] if still valid for the current channel count.
  _ChannelPreset? get _validTargetChannels => _targetPresets.contains(_targetChannels) ? _targetChannels : null;

  VirtualNodeSpec _spec() {
    final name = _name.text.trim();
    final description = _description.text.trim();
    final extra = _extraProperties.text.trim();
    return switch (_kind) {
      _Kind.nullSink => NullSinkSpec(
        name: name,
        description: description,
        channelMap: _channelMap,
        rate: _rate,
        resampleDisable: _resampleDisable,
        extraProperties: extra,
      ),
      _Kind.loopbackSink => LoopbackSinkSpec(
        name: name,
        description: description,
        channelMap: _channelMap,
        rate: _rate,
        resampleDisable: _resampleDisable,
        extraProperties: extra,
        output: _target,
        outputChannelMap: _validTargetChannels?.positions,
        remix: _remix,
      ),
      _Kind.capture => CaptureSpec(
        name: name,
        description: description,
        channelMap: _channelMap,
        rate: _rate,
        resampleDisable: _resampleDisable,
        extraProperties: extra,
        input: _target,
        inputChannelMap: _validTargetChannels?.positions,
        remix: _remix,
      ),
    };
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop(_spec());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ConsoleDialog(
        icon: Icons.add,
        accent: ConsoleColors.accentBright,
        accentBackground: ConsoleColors.accentContainer,
        title: 'New node',
        subtitle: 'Virtual node via pactl load-module, lives until removed',
        actions: [
          ConsoleButton(label: 'Cancel', onPressed: () => Navigator.of(context).pop()),
          ConsoleButton(label: 'Create node', icon: Icons.add, kind: ConsoleButtonKind.primary, onPressed: _submit),
        ],
        children: [
          _kindCards(),
          _nameFields(),
          if (_kind == _Kind.loopbackSink)
            ConsoleField(
              label: 'Output to',
              child: ConsoleSelect<String?>(
                value: _target,
                items: [(null, 'Default sink'), for (final sink in widget.sinks) (sink.name, sink.label)],
                detail: (name) => name,
                onChanged: (value) => setState(() => _target = value),
              ),
            ),
          if (_kind == _Kind.capture)
            ConsoleField(
              label: 'Capture from',
              child: ConsoleSelect<String?>(
                value: _target,
                items: [(null, 'Default source'), for (final source in widget.sources) (source.name, source.label)],
                detail: (name) => name,
                onChanged: (value) => setState(() => _target = value),
              ),
            ),
          _channelFields(),
          _rateFields(),
          ConsoleField(
            label: 'Extra node properties',
            child: ConsoleTextField(
              controller: _extraProperties,
              mono: true,
              hint: 'key=value key=value  (e.g. node.latency=256/48000)',
              onChanged: (_) => setState(() {}),
            ),
          ),
          _preview(),
        ],
      ),
    );
  }

  Widget _kindCards() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Expanded(child: _kindCard(_Kind.nullSink, Icons.speaker, 'Null sink', 'No device behind; audio comes out of its monitor')),
          Expanded(child: _kindCard(_Kind.loopbackSink, Icons.repeat, 'Loopback sink', 'Forwards to an output, passive: the DAC can change rate')),
          Expanded(child: _kindCard(_Kind.capture, Icons.mic_none, 'Capture', 'Records from a source or a sink monitor')),
        ],
      ),
    );
  }

  Widget _kindCard(_Kind kind, IconData icon, String title, String description) {
    final selected = kind == _kind;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: selected ? const BorderSide(color: ConsoleColors.accentBright, width: 1.5) : const BorderSide(color: ConsoleColors.divider),
    );
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? ConsoleColors.accentCard : ConsoleColors.panel,
        shape: shape,
        child: InkWell(
          customBorder: shape,
          onTap: () => setState(() {
            _kind = kind;
            _target = null;
          }),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Icon(icon, size: 20, color: selected ? ConsoleColors.accentBright : ConsoleColors.muted),
                      Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ConsoleColors.text)),
                      Text(description, style: consoleHintStyle),
                    ],
                  ),
                ),
                if (selected)
                  const DecoratedBox(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: ConsoleColors.accentBright),
                    child: Padding(padding: EdgeInsets.all(3), child: Icon(Icons.check, size: 12, color: ConsoleColors.onAccent)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameFields() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Expanded(
          child: ConsoleField(
            label: 'Name',
            child: ConsoleTextField(
              controller: _name,
              mono: true,
              hint: 'Virtual_Sink',
              validator: _validateName,
              onChanged: (_) => setState(() {}),
            ),
          ),
        ),
        Expanded(
          child: ConsoleField(
            label: 'Description',
            child: ConsoleTextField(controller: _description, hint: 'Empty = name', onChanged: (_) => setState(() {})),
          ),
        ),
      ],
    );
  }

  Widget _channelFields() {
    return ConsoleField(
      label: 'Channels',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final preset in _presets)
                ConsoleToggleChip(
                  label: preset.label,
                  selected: _channels == preset,
                  onSelected: (_) => setState(() => _channels = preset),
                ),
              ConsoleToggleChip(label: 'Custom…', selected: _channels == null, onSelected: (_) => setState(() => _channels = null)),
            ],
          ),
          if (_channels == null)
            ConsoleTextField(
              controller: _customChannels,
              mono: true,
              hint: 'aux0,aux1,aux2',
              validator: _validatePositions,
              onChanged: (_) => setState(() {}),
            ),
          if (_kind != _Kind.nullSink)
            Row(
              spacing: 10,
              children: [
                Text(_kind == _Kind.capture ? 'Input map' : 'Output map', style: const TextStyle(fontSize: 12, color: ConsoleColors.muted)),
                Expanded(
                  child: ConsoleSegmented<_ChannelPreset?>(
                    value: _validTargetChannels,
                    items: [(null, 'Same'), for (final preset in _targetPresets) (preset, preset.label)],
                    onChanged: (value) => setState(() => _targetChannels = value),
                  ),
                ),
                const SizedBox(width: 6),
                const Text('Remix', style: TextStyle(fontSize: 12, color: ConsoleColors.text)),
                ConsoleSwitch(value: _remix, label: 'Remix channels', onChanged: (value) => setState(() => _remix = value)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _rateFields() {
    return ConsoleField(
      label: 'Sample rate',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          ConsoleSegmented<int?>(
            value: _rate,
            mono: true,
            items: [(null, 'Follow graph'), for (final rate in _rates) (rate, _shortRate(rate))],
            onChanged: (value) => setState(() {
              _rate = value;
              _resampleDisable = _resampleDisable && value == null;
            }),
          ),
          ConsoleSwitchRow(
            title: 'resample.disable',
            monoTitle: true,
            description: _rate == null
                ? 'Never resample: always run at the graph rate'
                : 'Not with an explicit rate: the node would fail to start when the graph runs at another rate',
            value: _resampleDisable,
            onChanged: _rate == null ? (value) => setState(() => _resampleDisable = value) : null,
          ),
        ],
      ),
    );
  }

  /// Shell-ready (copy and paste works), keys and values colored.
  Widget _preview() {
    final spec = _spec();
    final arguments = [for (final argument in spec.moduleArguments) _shellQuoted(argument)];
    final text = ['pactl load-module ${spec.moduleName}', for (final argument in arguments) '    $argument'].join(' \\\n');
    return ConsoleCodeBlock(
      text: text,
      spans: [
        const TextSpan(text: 'pactl load-module '),
        TextSpan(text: spec.moduleName, style: const TextStyle(color: ConsoleColors.accentBright)),
        for (final argument in arguments) ..._argumentSpans(argument),
      ],
    );
  }

  /// ` \` + newline + indented `key=value`, key and value colored.
  List<TextSpan> _argumentSpans(String argument) {
    final equals = argument.indexOf('=');
    return [
      const TextSpan(text: ' \\\n    '),
      TextSpan(text: argument.substring(0, equals + 1), style: const TextStyle(color: ConsoleColors.codeKey)),
      TextSpan(text: argument.substring(equals + 1), style: const TextStyle(color: ConsoleColors.codeValue)),
    ];
  }

  /// 44100 → `44.1k`, 48000 → `48k`.
  String _shortRate(int rate) {
    final thousands = rate / 1000;
    if (thousands == thousands.roundToDouble()) {
      return '${thousands.round()}k';
    }
    return '${thousands}k';
  }

  String? _validateName(String? value) {
    final name = value?.trim() ?? '';
    return switch (name) {
      '' => 'Required',
      _ when !_namePattern.hasMatch(name) => 'Only letters, digits, _ . -',
      _ when widget.takenNames.contains(name) => 'A node with this name already exists',
      _ => null,
    };
  }

  String? _validatePositions(String? value) {
    final positions = [for (final position in (value ?? '').split(',')) if (position.trim().isNotEmpty) position.trim()];
    final unknown = positions.where((position) => !_positionPattern.hasMatch(position)).toList();
    return switch (positions) {
      [] => 'At least one position, comma separated',
      _ when unknown.isNotEmpty => 'Unknown: ${unknown.join(', ')}',
      _ => null,
    };
  }
}

/// Characters the shell would interpret: the argument needs quoting.
final _shellSpecial = RegExp(r'''[\s'"\\$`!*?;&|<>()]''');

/// Characters still special inside double quotes: escaped with a backslash.
final _doubleQuoteSpecial = RegExp(r'[\\"$`]');

/// Double quotes for the shell when needed.
String _shellQuoted(String argument) {
  if (argument.contains(_shellSpecial)) {
    final escaped = argument.replaceAllMapped(_doubleQuoteSpecial, (match) => '\\${match[0]}');
    return '"$escaped"';
  }
  return argument;
}
