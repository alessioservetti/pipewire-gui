import 'dart:convert';

import 'package:pipewire_gui/core/process/command_runner.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/dto/pactl_module_dto.dart';
import 'package:pipewire_gui/features/pipewire_graph/data/dto/pw_object_dto.dart';

/// Thin wrapper over the PipeWire / WirePlumber / pactl CLIs:
/// runs them and decodes their raw output into DTOs. No logic here.
class PipewireCliService {
  const PipewireCliService(this._runner);

  final CommandRunner _runner;

  /// `pw-dump`
  Future<List<PwObjectDto>> dump() async {
    final output = await _runner.run('pw-dump', const []);
    final decoded = jsonDecode(output) as List<dynamic>;
    return [
      for (final item in decoded)
        PwObjectDto.fromJson(item as Map<String, Object?>),
    ];
  }

  /// `pactl list modules short`
  Future<List<PactlModuleDto>> pulseModules() async {
    final output =
        await _runner.run('pactl', const ['list', 'modules', 'short']);
    return const LineSplitter()
        .convert(output)
        .map(_parseModuleLine)
        .nonNulls
        .toList();
  }

  /// `pw-top -b`, kept running (line-buffered through `stdbuf`).
  ///
  /// pw-top reads the PipeWire profiler and prints one table per cycle (about every second).
  /// For every table this emits the graph rate of each active driver (driver id → RATE column):
  /// the rate the audio of that driver's group really flows at. Not available in `pw-dump`.
  Stream<Map<int, int>> driverRates() async* {
    var table = <int, int>{};
    var seen = <int>{};
    await for (final raw in _runner.lines('stdbuf', const ['-oL', 'pw-top', '-b'])) {
      final line = raw.replaceAll(_ansi, '');
      final id = _rowId(line);
      // A new table starts with the header, or when an id shows up again.
      final newTable = _header.hasMatch(line) || (id != null && seen.contains(id));
      if (newTable && seen.isNotEmpty) {
        yield table;
      }
      if (newTable) {
        table = <int, int>{};
        seen = <int>{};
      }
      if (id != null) {
        seen.add(id);
        if (_driverRate(line) case final int rate) {
          table[id] = rate;
        }
      }
    }
  }

  /// `wpctl <args>`
  Future<void> wpctl(List<String> args) => _runner.run('wpctl', args);

  /// `pw-link <args>`
  Future<void> pwLink(List<String> args) => _runner.run('pw-link', args);

  /// `pw-metadata <args>`
  Future<void> pwMetadata(List<String> args) => _runner.run('pw-metadata', args);

  /// `pw-cli <args>`
  Future<void> pwCli(List<String> args) => _runner.run('pw-cli', args);

  /// `pactl <args>`, returns stdout (e.g. the index printed by `load-module`).
  Future<String> pactl(List<String> args) => _runner.run('pactl', args);

  static PactlModuleDto? _parseModuleLine(String line) {
    final fields = line.split('\t');
    final index = int.tryParse(fields.first);
    if (index != null && fields.length >= 2) {
      return PactlModuleDto(
        index: index,
        name: fields[1],
        argument: fields.length > 2 ? fields[2] : '',
      );
    }
    return null;
  }

  // pw-top table: `S  ID  QUANT  RATE  WAIT  BUSY  W/Q  B/Q  ERR  FORMAT  NAME`,
  // followers are listed under their driver with `+ ` before the name.
  static final _ansi = RegExp(r'\x1B\[[0-9;?]*[A-Za-z]');
  static final _header = RegExp(r'^\s*S\s+ID\s+QUANT\s+RATE\b');
  static final _row = RegExp(r'^\s*\S\s+(\d+)\s+(\d+)\s+(\d+)\s');
  static final _follower = RegExp(r'\s\+\s');

  static int? _rowId(String line) => int.tryParse(_row.firstMatch(line)?.group(1) ?? '');

  /// RATE of a driver row; null for followers and for idle drivers (RATE 0).
  static int? _driverRate(String line) {
    final rate = int.tryParse(_row.firstMatch(line)?.group(3) ?? '');
    if (rate != null && rate > 0 && !_follower.hasMatch(line)) {
      return rate;
    }
    return null;
  }
}
