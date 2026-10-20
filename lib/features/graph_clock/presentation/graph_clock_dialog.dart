import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';
import 'package:pipewire_gui/core/widgets/console_widgets.dart';
import 'package:pipewire_gui/features/graph_clock/application/graph_clock_controller.dart';
import 'package:pipewire_gui/features/graph_clock/application/graph_clock_providers.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/clock_settings.dart';

/// Graph clock, live: what the graph runs at now (profiler) and the `settings` metadata
/// (forced / allowed / default rate, quantum). Every change is applied at once with
/// `pw-metadata -n settings 0 <key> <value>`; nothing is restarted. The dialog watches the
/// state, so it shows the effect of each change (and of changes made elsewhere).
class GraphClockDialog extends ConsumerWidget {
  const GraphClockDialog({super.key});

  static const _rates = [44100, 48000, 88200, 96000, 176400, 192000];
  static const _quanta = [16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192];

  /// Force-quantum choices shown as segments (the others stay reachable from the config).
  static const _forceQuanta = [32, 64, 128, 256, 512, 1024, 2048];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drivers = ref.watch(runningDriversProvider);
    final clock = ref.watch(clockSettingsProvider);

    void change(ClockSetting setting, int? value) => ref.read(graphClockControllerProvider.notifier).setSetting(setting, value);

    return ConsoleDialog(
      icon: Icons.speed,
      accent: ConsoleColors.warning,
      accentBackground: ConsoleColors.warningContainer,
      title: 'Graph clock',
      subtitle: 'Live via pw-metadata · nothing restarts',
      footerNote: 'A PipeWire restart goes back to the config values.',
      actions: [ConsoleButton(label: 'Close', onPressed: () => Navigator.of(context).pop())],
      children: [
        _running(drivers),
        ConsoleField(
          label: 'Force rate',
          trailing: _key('clock.force-rate'),
          hint: 'Only allowed rates: PipeWire ignores any other.',
          child: ConsoleSegmented<int?>(
            value: clock.forceRate,
            mono: true,
            selectedColor: ConsoleColors.warning,
            selectedBackground: ConsoleColors.warningSegment,
            items: [
              (null, 'Automatic'),
              for (final rate in _withCurrent(clock.allowedRates, clock.forceRate))
                (rate, clock.allowedRates.contains(rate) ? groupedDigits(rate) : '${groupedDigits(rate)} (ignored)'),
            ],
            onChanged: (rate) => change(ClockSetting.forceRate, rate),
          ),
        ),
        _allowedRates(ref, clock.allowedRates),
        ConsoleField(
          label: 'Default rate',
          trailing: _key('clock.rate'),
          hint: 'Used when no stream asks for another allowed rate.',
          child: ConsoleSelect<int?>(
            value: clock.rate,
            mono: true,
            items: [
              (null, 'From the PipeWire config'),
              for (final rate in _withCurrent(_rates, clock.rate)) (rate, '${groupedDigits(rate)} Hz'),
            ],
            onChanged: (rate) => change(ClockSetting.rate, rate),
          ),
        ),
        const Divider(height: 1, color: ConsoleColors.divider),
        ConsoleField(
          label: 'Force quantum',
          trailing: _key('clock.force-quantum'),
          hint: 'Buffer size in samples; only a value between min and max is applied.',
          child: ConsoleSegmented<int?>(
            value: clock.forceQuantum,
            mono: true,
            selectedColor: ConsoleColors.warning,
            selectedBackground: ConsoleColors.warningSegment,
            items: [
              (null, 'Automatic'),
              for (final quantum in _withCurrent(_forceQuanta.where((q) => _inRange(q, clock)), clock.forceQuantum)) (quantum, '$quantum'),
            ],
            onChanged: (quantum) => change(ClockSetting.forceQuantum, quantum),
          ),
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(child: _quantum('Quantum', clock.quantum, (value) => change(ClockSetting.quantum, value))),
            Expanded(child: _quantum('Min', clock.minQuantum, (value) => change(ClockSetting.minQuantum, value))),
            Expanded(child: _quantum('Max', clock.maxQuantum, (value) => change(ClockSetting.maxQuantum, value))),
          ],
        ),
      ],
    );
  }

  /// Rate of every running driver group, as measured by the profiler.
  Widget _running(IList<RunningDriver> drivers) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ConsoleColors.field,
        border: Border.all(color: ConsoleColors.divider),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ConsoleSectionLabel('Running now', trailing: Text('pw-top profiler', style: TextStyle(fontSize: 11, color: ConsoleColors.muted))),
          ),
          if (drivers.isNotEmpty)
            for (final driver in drivers)
              DecoratedBox(
                decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF2E3034)))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    spacing: 12,
                    children: [
                      const ConsoleLed(on: true),
                      Expanded(child: Text(driver.name, style: const TextStyle(fontSize: 14, color: ConsoleColors.text))),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: groupedDigits(driver.rate), style: consoleMono(size: 24, weight: FontWeight.w600)),
                            TextSpan(text: ' Hz', style: consoleMono(size: 12, color: ConsoleColors.muted)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          else
            const DecoratedBox(
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF2E3034)))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  spacing: 12,
                  children: [
                    ConsoleLed(on: false),
                    Text('No driver running: the graph is idle', style: TextStyle(fontSize: 14, color: ConsoleColors.muted)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// One chip per rate, toggled live; at least one stays selected.
  Widget _allowedRates(WidgetRef ref, IList<int> allowed) {
    void apply(List<int> rates) => ref.read(graphClockControllerProvider.notifier).setAllowedRates(rates);

    return ConsoleField(
      label: 'Allowed rates',
      trailing: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ConsoleColors.link,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: const TextStyle(fontSize: 12),
        ),
        onPressed: () => apply(const []),
        child: const Text('Reset to config'),
      ),
      hint: 'The graph follows the streams among these, switching when the driver is idle.',
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final rate in _withCurrent(_rates, null).followedBy(allowed.where((r) => !_rates.contains(r))))
            ConsoleToggleChip(
              label: groupedDigits(rate),
              mono: true,
              selected: allowed.contains(rate),
              onSelected: (selected) {
                final next = selected ? [...allowed, rate] : [...allowed.where((r) => r != rate)];
                if (next.isNotEmpty) {
                  apply(next..sort());
                }
              },
            ),
        ],
      ),
    );
  }

  Widget _quantum(String label, int? value, ValueChanged<int?> onChanged) {
    return ConsoleField(
      label: label,
      child: ConsoleSelect<int?>(
        value: value,
        mono: true,
        items: [
          (null, 'Config'),
          for (final quantum in _withCurrent(_quanta, value)) (quantum, '$quantum'),
        ],
        onChanged: onChanged,
      ),
    );
  }

  Widget _key(String key) => Text(key, style: consoleMono(size: 11, weight: FontWeight.w400, color: ConsoleColors.muted));

  /// [options] plus [current] when it is not among them (a dropdown must contain its value),
  /// sorted.
  static List<int> _withCurrent(Iterable<int> options, int? current) => {
    ...options,
    ?current,
  }.toList()..sort();

  /// Within the min..max quantum PipeWire checks force-quantum against (unknown bounds: no limit).
  static bool _inRange(int quantum, ClockSettings clock) =>
      quantum >= (clock.minQuantum ?? 0) && quantum <= (clock.maxQuantum ?? quantum);
}
