import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pipewire_gui/features/patchbay/application/patchbay_controller.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_style.dart';
import 'package:pipewire_gui/features/pipewire_graph/application/graph_selectors.dart';

/// Volume of a node inside its box: mute button, slider (wpctl scale, up to 150%) and percentage,
/// same behaviour as the mixer: the thumb follows the drag, the volume is set on release.
///
/// Reads volume and mute of its own node, so a volume change rebuilds only this bar, never the
/// patchbay. Its size never changes with the value (the percentage reserves the width of the
/// widest one), so the slider does not resize while dragging and the box geometry stays valid.
class PatchbayVolumeBar extends ConsumerStatefulWidget {
  const PatchbayVolumeBar({super.key, required this.nodeId});

  final int nodeId;

  @override
  ConsumerState<PatchbayVolumeBar> createState() => _PatchbayVolumeBarState();
}

class _PatchbayVolumeBarState extends ConsumerState<PatchbayVolumeBar> {
  static const _maxVolume = 1.0;
  static const _labelStyle = TextStyle(color: PatchbayColors.nodeTitle, fontSize: 10);

  /// Local value while dragging: polling must not move the thumb under the cursor.
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    final mixer = ref.watch(pwNodeProvider(widget.nodeId).select((node) => (volume: node?.volume ?? 1.0, mute: node?.mute ?? false)));
    final volume = (_dragValue ?? mixer.volume).clamp(0.0, _maxVolume);

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 8, 4),
      child: Row(
        children: [
          IconButton(
            tooltip: mixer.mute ? 'Unmute' : 'Mute',
            icon: Icon(mixer.mute ? Icons.volume_off : Icons.volume_up),
            iconSize: 16,
            color: mixer.mute ? PatchbayColors.muted : PatchbayColors.nodeTitle,
            padding: const EdgeInsets.all(2),
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onPressed: () => ref.read(patchbayControllerProvider.notifier).toggleMute(widget.nodeId),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
              ),
              child: Slider(
                value: volume,
                max: _maxVolume,
                activeColor: mixer.mute ? PatchbayColors.mutedSlider : PatchbayColors.volume,
                onChanged: (value) => setState(() => _dragValue = value),
                onChangeEnd: _commit,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Visibility.maintain(visible: false, child: Text(_percent(_maxVolume), style: _labelStyle)),
              Text(_percent(volume), style: _labelStyle),
            ],
          ),
        ],
      ),
    );
  }

  String _percent(double volume) => '${(volume * 100).round()}%';

  Future<void> _commit(double volume) async {
    await ref.read(patchbayControllerProvider.notifier).setVolume(widget.nodeId, volume);
    if (mounted) {
      setState(() => _dragValue = null);
    }
  }
}
