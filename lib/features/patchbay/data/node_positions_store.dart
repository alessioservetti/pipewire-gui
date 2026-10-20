import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

/// Patchbay node positions (layout coordinates) by node key (`PatchbayNode.key`), kept between
/// sessions in `$XDG_STATE_HOME/pipewire_gui/node_positions.json` (default `~/.local/state`).
///
/// ```json
/// {"version": 1, "nodes": {"Audio/Sink|Virtual_Sink": {"x": 40.0, "y": 40.0}}}
/// ```
class NodePositionsStore {
  const NodePositionsStore(this._file);

  /// The XDG state file of the current user.
  factory NodePositionsStore.user() {
    final environment = Platform.environment;
    final state = environment['XDG_STATE_HOME'] ?? '${environment['HOME']}/.local/state';
    return NodePositionsStore(File('$state/pipewire_gui/node_positions.json'));
  }

  static const _version = 1;

  final File _file;

  /// Saved positions; empty when there is no file yet or it is unreadable (it is rewritten at the
  /// next save).
  Future<IMap<String, Offset>> load() async {
    if (await _file.exists()) {
      try {
        return _decode(jsonDecode(await _file.readAsString()));
      } on FormatException {
        return const IMapConst<String, Offset>({});
      }
    }
    return const IMapConst<String, Offset>({});
  }

  /// Replaces the saved positions. Written to a temporary file and renamed: a crash never leaves
  /// a half-written file.
  Future<void> save(Map<String, Offset> positions) async {
    await _file.parent.create(recursive: true);
    final temporary = File('${_file.path}.tmp');
    await temporary.writeAsString(
      jsonEncode({
        'version': _version,
        'nodes': {
          for (final MapEntry(key: key, value: position) in positions.entries) key: {'x': position.dx, 'y': position.dy},
        },
      }),
      flush: true,
    );
    await temporary.rename(_file.path);
  }

  /// Entries that are not `{"x": number, "y": number}` are skipped.
  static IMap<String, Offset> _decode(Object? json) {
    if (json case {'nodes': final Map<String, dynamic> nodes}) {
      return {
        for (final MapEntry(key: key, value: value) in nodes.entries)
          if (value case {'x': final num x, 'y': final num y}) key: Offset(x.toDouble(), y.toDouble()),
      }.lock;
    }
    return const IMapConst<String, Offset>({});
  }
}
