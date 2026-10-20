// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GraphSnapshot {

 IList<PwNode> get nodes; IList<PwDevice> get devices; IList<PwPort> get ports; IList<PwLink> get links;/// `default.audio.sink` from the `default` metadata (node name).
 String? get defaultSinkName;/// `default.audio.source` from the `default` metadata (node name).
 String? get defaultSourceName;/// Clock entries of the `settings` metadata (rate, allowed / forced rate, quantum).
 ClockSettings get clock;
/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphSnapshotCopyWith<GraphSnapshot> get copyWith => _$GraphSnapshotCopyWithImpl<GraphSnapshot>(this as GraphSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GraphSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphSnapshot&&const DeepCollectionEquality().equals(other.nodes, _this.nodes)&&const DeepCollectionEquality().equals(other.devices, _this.devices)&&const DeepCollectionEquality().equals(other.ports, _this.ports)&&const DeepCollectionEquality().equals(other.links, _this.links)&&(identical(other.defaultSinkName, _this.defaultSinkName) || other.defaultSinkName == _this.defaultSinkName)&&(identical(other.defaultSourceName, _this.defaultSourceName) || other.defaultSourceName == _this.defaultSourceName)&&(identical(other.clock, _this.clock) || other.clock == _this.clock));
}


@override
int get hashCode {
  final _this = this as GraphSnapshot;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.nodes),const DeepCollectionEquality().hash(_this.devices),const DeepCollectionEquality().hash(_this.ports),const DeepCollectionEquality().hash(_this.links),_this.defaultSinkName,_this.defaultSourceName,_this.clock);
}

@override
String toString() {
  final _this = this as GraphSnapshot;
  return 'GraphSnapshot(nodes: ${_this.nodes}, devices: ${_this.devices}, ports: ${_this.ports}, links: ${_this.links}, defaultSinkName: ${_this.defaultSinkName}, defaultSourceName: ${_this.defaultSourceName}, clock: ${_this.clock})';
}


}

/// @nodoc
abstract mixin class $GraphSnapshotCopyWith<$Res>  {
  factory $GraphSnapshotCopyWith(GraphSnapshot value, $Res Function(GraphSnapshot) _then) = _$GraphSnapshotCopyWithImpl;
@useResult
$Res call({
 IList<PwNode> nodes, IList<PwDevice> devices, IList<PwPort> ports, IList<PwLink> links, String? defaultSinkName, String? defaultSourceName, ClockSettings clock
});


$ClockSettingsCopyWith<$Res> get clock;

}
/// @nodoc
class _$GraphSnapshotCopyWithImpl<$Res>
    implements $GraphSnapshotCopyWith<$Res> {
  _$GraphSnapshotCopyWithImpl(this._self, this._then);

  final GraphSnapshot _self;
  final $Res Function(GraphSnapshot) _then;

/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodes = null,Object? devices = null,Object? ports = null,Object? links = null,Object? defaultSinkName = freezed,Object? defaultSourceName = freezed,Object? clock = null,}) {
  return _then(GraphSnapshot(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as IList<PwNode>,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as IList<PwDevice>,ports: null == ports ? _self.ports : ports // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as IList<PwLink>,defaultSinkName: freezed == defaultSinkName ? _self.defaultSinkName : defaultSinkName // ignore: cast_nullable_to_non_nullable
as String?,defaultSourceName: freezed == defaultSourceName ? _self.defaultSourceName : defaultSourceName // ignore: cast_nullable_to_non_nullable
as String?,clock: null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as ClockSettings,
  ));
}
/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockSettingsCopyWith<$Res> get clock {
  
  return $ClockSettingsCopyWith<$Res>(_self.clock, (value) {
    return _then(_self.copyWith(clock: value));
  });
}
}


/// Adds pattern-matching-related methods to [GraphSnapshot].
extension GraphSnapshotPatterns on GraphSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _GraphSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _GraphSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IList<PwNode> nodes,  IList<PwDevice> devices,  IList<PwPort> ports,  IList<PwLink> links,  String? defaultSinkName,  String? defaultSourceName,  ClockSettings clock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphSnapshot() when $default != null:
return $default(_that.nodes,_that.devices,_that.ports,_that.links,_that.defaultSinkName,_that.defaultSourceName,_that.clock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IList<PwNode> nodes,  IList<PwDevice> devices,  IList<PwPort> ports,  IList<PwLink> links,  String? defaultSinkName,  String? defaultSourceName,  ClockSettings clock)  $default,) {final _that = this;
switch (_that) {
case _GraphSnapshot():
return $default(_that.nodes,_that.devices,_that.ports,_that.links,_that.defaultSinkName,_that.defaultSourceName,_that.clock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IList<PwNode> nodes,  IList<PwDevice> devices,  IList<PwPort> ports,  IList<PwLink> links,  String? defaultSinkName,  String? defaultSourceName,  ClockSettings clock)?  $default,) {final _that = this;
switch (_that) {
case _GraphSnapshot() when $default != null:
return $default(_that.nodes,_that.devices,_that.ports,_that.links,_that.defaultSinkName,_that.defaultSourceName,_that.clock);case _:
  return null;

}
}

}

/// @nodoc


class _GraphSnapshot extends GraphSnapshot {
  const _GraphSnapshot({this.nodes = const IListConst<PwNode>([]), this.devices = const IListConst<PwDevice>([]), this.ports = const IListConst<PwPort>([]), this.links = const IListConst<PwLink>([]), this.defaultSinkName, this.defaultSourceName, this.clock = const ClockSettings()}): super._();
  

@override@JsonKey() final  IList<PwNode> nodes;
@override@JsonKey() final  IList<PwDevice> devices;
@override@JsonKey() final  IList<PwPort> ports;
@override@JsonKey() final  IList<PwLink> links;
/// `default.audio.sink` from the `default` metadata (node name).
@override final  String? defaultSinkName;
/// `default.audio.source` from the `default` metadata (node name).
@override final  String? defaultSourceName;
/// Clock entries of the `settings` metadata (rate, allowed / forced rate, quantum).
@override@JsonKey() final  ClockSettings clock;

/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphSnapshotCopyWith<_GraphSnapshot> get copyWith => __$GraphSnapshotCopyWithImpl<_GraphSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphSnapshot&&const DeepCollectionEquality().equals(other.nodes, nodes)&&const DeepCollectionEquality().equals(other.devices, devices)&&const DeepCollectionEquality().equals(other.ports, ports)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.defaultSinkName, defaultSinkName) || other.defaultSinkName == defaultSinkName)&&(identical(other.defaultSourceName, defaultSourceName) || other.defaultSourceName == defaultSourceName)&&(identical(other.clock, clock) || other.clock == clock));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(nodes),const DeepCollectionEquality().hash(devices),const DeepCollectionEquality().hash(ports),const DeepCollectionEquality().hash(links),defaultSinkName,defaultSourceName,clock);
}

@override
String toString() {
    return 'GraphSnapshot(nodes: $nodes, devices: $devices, ports: $ports, links: $links, defaultSinkName: $defaultSinkName, defaultSourceName: $defaultSourceName, clock: $clock)';
}


}

/// @nodoc
abstract mixin class _$GraphSnapshotCopyWith<$Res> implements $GraphSnapshotCopyWith<$Res> {
  factory _$GraphSnapshotCopyWith(_GraphSnapshot value, $Res Function(_GraphSnapshot) _then) = __$GraphSnapshotCopyWithImpl;
@override @useResult
$Res call({
 IList<PwNode> nodes, IList<PwDevice> devices, IList<PwPort> ports, IList<PwLink> links, String? defaultSinkName, String? defaultSourceName, ClockSettings clock
});


@override $ClockSettingsCopyWith<$Res> get clock;

}
/// @nodoc
class __$GraphSnapshotCopyWithImpl<$Res>
    implements _$GraphSnapshotCopyWith<$Res> {
  __$GraphSnapshotCopyWithImpl(this._self, this._then);

  final _GraphSnapshot _self;
  final $Res Function(_GraphSnapshot) _then;

/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodes = null,Object? devices = null,Object? ports = null,Object? links = null,Object? defaultSinkName = freezed,Object? defaultSourceName = freezed,Object? clock = null,}) {
  return _then(_GraphSnapshot(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as IList<PwNode>,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as IList<PwDevice>,ports: null == ports ? _self.ports : ports // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as IList<PwLink>,defaultSinkName: freezed == defaultSinkName ? _self.defaultSinkName : defaultSinkName // ignore: cast_nullable_to_non_nullable
as String?,defaultSourceName: freezed == defaultSourceName ? _self.defaultSourceName : defaultSourceName // ignore: cast_nullable_to_non_nullable
as String?,clock: null == clock ? _self.clock : clock // ignore: cast_nullable_to_non_nullable
as ClockSettings,
  ));
}

/// Create a copy of GraphSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClockSettingsCopyWith<$Res> get clock {
  
  return $ClockSettingsCopyWith<$Res>(_self.clock, (value) {
    return _then(_self.copyWith(clock: value));
  });
}
}

// dart format on
