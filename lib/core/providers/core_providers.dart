import 'package:pipewire_gui/core/process/command_runner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
CommandRunner commandRunner(Ref ref) => const ProcessCommandRunner();
