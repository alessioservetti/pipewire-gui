import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/core/theme/console_colors.dart';
import 'package:pipewire_gui/core/widgets/console_widgets.dart';
import 'package:pipewire_gui/features/graph_clock/application/graph_clock_controller.dart';
import 'package:pipewire_gui/features/graph_clock/application/graph_clock_providers.dart';
import 'package:pipewire_gui/features/graph_clock/presentation/graph_clock_dialog.dart';

/// Graph clock readout for a [ConsolePanel]: LED (green while a driver runs), the rate(s) the
/// graph runs at now (profiler), the driver name, FORCED when `clock.force-rate` is set.
/// The tooltip lists every driver. Opens [GraphClockDialog]; shows the clock command errors.
class GraphClockButton extends ConsumerWidget {
  const GraphClockButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(graphClockControllerProvider, (previous, next) {
      if (next case AsyncError(:final error)) {
        showConsoleError(context, error);
      }
    });

    final drivers = ref.watch(runningDriversProvider);
    final forced = ref.watch(clockSettingsProvider.select((clock) => clock.forceRate != null));
    final rates = {for (final driver in drivers) groupedDigits(driver.rate)}.join(' / ');
    final name = switch (drivers.length) {
      0 => 'No driver running',
      1 => drivers.first.name,
      final count => '${drivers.first.name} +${count - 1}',
    };

    return Tooltip(
      message: drivers.isNotEmpty ? [for (final driver in drivers) '${driver.name}: ${driver.rate} Hz'].join('\n') : 'The graph is idle',
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ConsoleColors.text,
          padding: const EdgeInsets.fromLTRB(12, 6, 10, 6),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => showDialog<void>(context: context, builder: (context) => const GraphClockDialog()),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            ConsoleLed(on: drivers.isNotEmpty),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                if (rates.isNotEmpty)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: rates, style: consoleMono(size: 17, weight: FontWeight.w600)),
                        TextSpan(text: ' Hz', style: consoleMono(size: 11, color: ConsoleColors.muted)),
                      ],
                    ),
                  )
                else
                  Text('Idle', style: consoleMono(size: 17, weight: FontWeight.w600, color: ConsoleColors.muted)),
                Text(name, style: const TextStyle(fontSize: 11, color: ConsoleColors.muted)),
              ],
            ),
            if (forced) const _ForcedBadge(),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: ConsoleColors.muted),
          ],
        ),
      ),
    );
  }
}

class _ForcedBadge extends StatelessWidget {
  const _ForcedBadge();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all(color: ConsoleColors.warning), borderRadius: BorderRadius.circular(4)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Text(
          'FORCED',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.8, color: ConsoleColors.warning),
        ),
      ),
    );
  }
}
