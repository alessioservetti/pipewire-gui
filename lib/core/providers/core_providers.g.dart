// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commandRunner)
final commandRunnerProvider = CommandRunnerProvider._();

final class CommandRunnerProvider
    extends $FunctionalProvider<CommandRunner, CommandRunner, CommandRunner>
    with $Provider<CommandRunner> {
  CommandRunnerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commandRunnerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commandRunnerHash();

  @$internal
  @override
  $ProviderElement<CommandRunner> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommandRunner create(Ref ref) {
    return commandRunner(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommandRunner value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommandRunner>(value),
    );
  }
}

String _$commandRunnerHash() => r'dbe4bdf66101ea0e224b7023c219c310681a6e53';
