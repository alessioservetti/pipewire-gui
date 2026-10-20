import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pipewire_gui/features/pipewire_graph/domain/models/pw_module.dart';

part 'node_owner.freezed.dart';

/// What keeps a node alive, for the nodes the GUI can remove. Removing the owner removes every
/// node it created (e.g. both halves of a loopback).
@freezed
sealed class NodeOwner with _$NodeOwner {
  /// pipewire-pulse module (`pactl load-module`): lives inside pipewire-pulse, removed with
  /// `pactl unload-module`.
  const factory NodeOwner.module(PwModule module) = ModuleOwner;

  /// `pw-loopback` process (started from a terminal, it keeps running): removed by destroying
  /// its PipeWire client (`pw-cli destroy`), the process loses the connection and exits.
  const factory NodeOwner.loopbackProcess({required int clientId, int? processId}) = LoopbackProcessOwner;
}
