import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:pipewire_gui/core/process/command_exception.dart';

/// Abstraction over process execution.
/// In tests, override `commandRunnerProvider` with a fake.
abstract interface class CommandRunner {
  /// Runs [executable] with [arguments] (no shell) and returns stdout.
  /// Throws [CommandException] on a non-zero exit code.
  Future<String> run(String executable, List<String> arguments);

  /// Starts a long-running [executable] and streams its stdout line by line.
  /// The process is killed when the subscription is cancelled.
  Stream<String> lines(String executable, List<String> arguments);
}

class ProcessCommandRunner implements CommandRunner {
  const ProcessCommandRunner();

  @override
  Future<String> run(String executable, List<String> arguments) async {
    final result = await Process.run(executable, arguments);
    if (result.exitCode == 0) {
      return result.stdout as String;
    }
    throw CommandException(
      executable: executable,
      arguments: arguments,
      exitCode: result.exitCode,
      stderr: result.stderr as String,
    );
  }

  @override
  Stream<String> lines(String executable, List<String> arguments) async* {
    final process = await Process.start(executable, arguments);
    unawaited(process.stderr.drain<void>());
    try {
      yield* process.stdout.transform(utf8.decoder).transform(const LineSplitter());
    } finally {
      process.kill();
    }
  }
}
