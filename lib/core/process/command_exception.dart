class CommandException implements Exception {
  const CommandException({
    required this.executable,
    required this.arguments,
    required this.exitCode,
    required this.stderr,
  });

  final String executable;
  final List<String> arguments;
  final int exitCode;
  final String stderr;

  @override
  String toString() =>
      'CommandException: $executable ${arguments.join(' ')} (exit $exitCode)\n$stderr';
}
