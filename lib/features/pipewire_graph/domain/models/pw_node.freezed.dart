// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwNode {

 int get id;/// `node.name`: stable identifier, used by the `default` metadata.
 String get name;/// `node.description` / `node.nick`: label for the UI.
 String get description;/// `media.class`, see MediaClass.
 String get mediaClass; PwNodeType get type;/// `device.id`, null for streams and virtual nodes.
 int? get deviceId;/// Volume in wpctl scale (cubic): 1.0 = 100%.
 double get volume; bool get mute;/// The node exposes a volume (`channelVolumes` in its device Route or its Props), so wpctl
/// can read and set it; [volume] and [mute] are meaningful only when true.
/// False e.g. for MIDI bridges and video nodes.
 bool get hasVolume;/// Effective sample rate (`Format.rate`). Null for DSP nodes without a
/// fixed rate (e.g. remap/loopback): they run at the graph clock.
 int? get rate;/// Module that created the node, null if not created via pactl.
 PwModule? get module;/// What keeps the node alive, when the GUI can remove it: its pactl [module], or the
/// `pw-loopback` process that created it. Null for devices, apps, WirePlumber nodes.
 NodeOwner? get owner;/// `node.link-group`: nodes with the same value are connected
/// internally (e.g. the two halves of a loopback / remap-source).
 String? get linkGroup;/// `node.driver-id`: driver of the group the node is running in.
/// Null when the node is idle or is itself the driver.
 int? get driverId;/// `resample.disable`: the node never resamples, it always runs at the graph rate.
 bool get resampleDisabled;
/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwNodeCopyWith<PwNode> get copyWith => _$PwNodeCopyWithImpl<PwNode>(this as PwNode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.mediaClass, _this.mediaClass) || other.mediaClass == _this.mediaClass)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.volume, _this.volume) || other.volume == _this.volume)&&(identical(other.mute, _this.mute) || other.mute == _this.mute)&&(identical(other.hasVolume, _this.hasVolume) || other.hasVolume == _this.hasVolume)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.module, _this.module) || other.module == _this.module)&&(identical(other.owner, _this.owner) || other.owner == _this.owner)&&(identical(other.linkGroup, _this.linkGroup) || other.linkGroup == _this.linkGroup)&&(identical(other.driverId, _this.driverId) || other.driverId == _this.driverId)&&(identical(other.resampleDisabled, _this.resampleDisabled) || other.resampleDisabled == _this.resampleDisabled));
}


@override
int get hashCode {
  final _this = this as PwNode;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.mediaClass,_this.type,_this.deviceId,_this.volume,_this.mute,_this.hasVolume,_this.rate,_this.module,_this.owner,_this.linkGroup,_this.driverId,_this.resampleDisabled);
}

@override
String toString() {
  final _this = this as PwNode;
  return 'PwNode(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, mediaClass: ${_this.mediaClass}, type: ${_this.type}, deviceId: ${_this.deviceId}, volume: ${_this.volume}, mute: ${_this.mute}, hasVolume: ${_this.hasVolume}, rate: ${_this.rate}, module: ${_this.module}, owner: ${_this.owner}, linkGroup: ${_this.linkGroup}, driverId: ${_this.driverId}, resampleDisabled: ${_this.resampleDisabled})';
}


}

/// @nodoc
abstract mixin class $PwNodeCopyWith<$Res>  {
  factory $PwNodeCopyWith(PwNode value, $Res Function(PwNode) _then) = _$PwNodeCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String mediaClass, PwNodeType type, int? deviceId, double volume, bool mute, bool hasVolume, int? rate, PwModule? module, NodeOwner? owner, String? linkGroup, int? driverId, bool resampleDisabled
});


$PwModuleCopyWith<$Res>? get module;$NodeOwnerCopyWith<$Res>? get owner;

}
/// @nodoc
class _$PwNodeCopyWithImpl<$Res>
    implements $PwNodeCopyWith<$Res> {
  _$PwNodeCopyWithImpl(this._self, this._then);

  final PwNode _self;
  final $Res Function(PwNode) _then;

/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? mediaClass = null,Object? type = null,Object? deviceId = freezed,Object? volume = null,Object? mute = null,Object? hasVolume = null,Object? rate = freezed,Object? module = freezed,Object? owner = freezed,Object? linkGroup = freezed,Object? driverId = freezed,Object? resampleDisabled = null,}) {
  return _then(PwNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mediaClass: null == mediaClass ? _self.mediaClass : mediaClass // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PwNodeType,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,mute: null == mute ? _self.mute : mute // ignore: cast_nullable_to_non_nullable
as bool,hasVolume: null == hasVolume ? _self.hasVolume : hasVolume // ignore: cast_nullable_to_non_nullable
as bool,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,module: freezed == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as PwModule?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NodeOwner?,linkGroup: freezed == linkGroup ? _self.linkGroup : linkGroup // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,resampleDisabled: null == resampleDisabled ? _self.resampleDisabled : resampleDisabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PwModuleCopyWith<$Res>? get module {
    if (_self.module == null) {
    return null;
  }

  return $PwModuleCopyWith<$Res>(_self.module!, (value) {
    return _then(_self.copyWith(module: value));
  });
}/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $NodeOwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [PwNode].
extension PwNodePatterns on PwNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwNode value)  $default,){
final _that = this;
switch (_that) {
case _PwNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwNode value)?  $default,){
final _that = this;
switch (_that) {
case _PwNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String mediaClass,  PwNodeType type,  int? deviceId,  double volume,  bool mute,  bool hasVolume,  int? rate,  PwModule? module,  NodeOwner? owner,  String? linkGroup,  int? driverId,  bool resampleDisabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwNode() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.mediaClass,_that.type,_that.deviceId,_that.volume,_that.mute,_that.hasVolume,_that.rate,_that.module,_that.owner,_that.linkGroup,_that.driverId,_that.resampleDisabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String mediaClass,  PwNodeType type,  int? deviceId,  double volume,  bool mute,  bool hasVolume,  int? rate,  PwModule? module,  NodeOwner? owner,  String? linkGroup,  int? driverId,  bool resampleDisabled)  $default,) {final _that = this;
switch (_that) {
case _PwNode():
return $default(_that.id,_that.name,_that.description,_that.mediaClass,_that.type,_that.deviceId,_that.volume,_that.mute,_that.hasVolume,_that.rate,_that.module,_that.owner,_that.linkGroup,_that.driverId,_that.resampleDisabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String mediaClass,  PwNodeType type,  int? deviceId,  double volume,  bool mute,  bool hasVolume,  int? rate,  PwModule? module,  NodeOwner? owner,  String? linkGroup,  int? driverId,  bool resampleDisabled)?  $default,) {final _that = this;
switch (_that) {
case _PwNode() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.mediaClass,_that.type,_that.deviceId,_that.volume,_that.mute,_that.hasVolume,_that.rate,_that.module,_that.owner,_that.linkGroup,_that.driverId,_that.resampleDisabled);case _:
  return null;

}
}

}

/// @nodoc


class _PwNode implements PwNode {
  const _PwNode({required this.id, required this.name, required this.description, required this.mediaClass, this.type = PwNodeType.other, this.deviceId, this.volume = 1.0, this.mute = false, this.hasVolume = false, this.rate, this.module, this.owner, this.linkGroup, this.driverId, this.resampleDisabled = false});
  

@override final  int id;
/// `node.name`: stable identifier, used by the `default` metadata.
@override final  String name;
/// `node.description` / `node.nick`: label for the UI.
@override final  String description;
/// `media.class`, see MediaClass.
@override final  String mediaClass;
@override@JsonKey() final  PwNodeType type;
/// `device.id`, null for streams and virtual nodes.
@override final  int? deviceId;
/// Volume in wpctl scale (cubic): 1.0 = 100%.
@override@JsonKey() final  double volume;
@override@JsonKey() final  bool mute;
/// The node exposes a volume (`channelVolumes` in its device Route or its Props), so wpctl
/// can read and set it; [volume] and [mute] are meaningful only when true.
/// False e.g. for MIDI bridges and video nodes.
@override@JsonKey() final  bool hasVolume;
/// Effective sample rate (`Format.rate`). Null for DSP nodes without a
/// fixed rate (e.g. remap/loopback): they run at the graph clock.
@override final  int? rate;
/// Module that created the node, null if not created via pactl.
@override final  PwModule? module;
/// What keeps the node alive, when the GUI can remove it: its pactl [module], or the
/// `pw-loopback` process that created it. Null for devices, apps, WirePlumber nodes.
@override final  NodeOwner? owner;
/// `node.link-group`: nodes with the same value are connected
/// internally (e.g. the two halves of a loopback / remap-source).
@override final  String? linkGroup;
/// `node.driver-id`: driver of the group the node is running in.
/// Null when the node is idle or is itself the driver.
@override final  int? driverId;
/// `resample.disable`: the node never resamples, it always runs at the graph rate.
@override@JsonKey() final  bool resampleDisabled;

/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwNodeCopyWith<_PwNode> get copyWith => __$PwNodeCopyWithImpl<_PwNode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.mediaClass, mediaClass) || other.mediaClass == mediaClass)&&(identical(other.type, type) || other.type == type)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.mute, mute) || other.mute == mute)&&(identical(other.hasVolume, hasVolume) || other.hasVolume == hasVolume)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.module, module) || other.module == module)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.linkGroup, linkGroup) || other.linkGroup == linkGroup)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.resampleDisabled, resampleDisabled) || other.resampleDisabled == resampleDisabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,mediaClass,type,deviceId,volume,mute,hasVolume,rate,module,owner,linkGroup,driverId,resampleDisabled);
}

@override
String toString() {
    return 'PwNode(id: $id, name: $name, description: $description, mediaClass: $mediaClass, type: $type, deviceId: $deviceId, volume: $volume, mute: $mute, hasVolume: $hasVolume, rate: $rate, module: $module, owner: $owner, linkGroup: $linkGroup, driverId: $driverId, resampleDisabled: $resampleDisabled)';
}


}

/// @nodoc
abstract mixin class _$PwNodeCopyWith<$Res> implements $PwNodeCopyWith<$Res> {
  factory _$PwNodeCopyWith(_PwNode value, $Res Function(_PwNode) _then) = __$PwNodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String mediaClass, PwNodeType type, int? deviceId, double volume, bool mute, bool hasVolume, int? rate, PwModule? module, NodeOwner? owner, String? linkGroup, int? driverId, bool resampleDisabled
});


@override $PwModuleCopyWith<$Res>? get module;@override $NodeOwnerCopyWith<$Res>? get owner;

}
/// @nodoc
class __$PwNodeCopyWithImpl<$Res>
    implements _$PwNodeCopyWith<$Res> {
  __$PwNodeCopyWithImpl(this._self, this._then);

  final _PwNode _self;
  final $Res Function(_PwNode) _then;

/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? mediaClass = null,Object? type = null,Object? deviceId = freezed,Object? volume = null,Object? mute = null,Object? hasVolume = null,Object? rate = freezed,Object? module = freezed,Object? owner = freezed,Object? linkGroup = freezed,Object? driverId = freezed,Object? resampleDisabled = null,}) {
  return _then(_PwNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mediaClass: null == mediaClass ? _self.mediaClass : mediaClass // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PwNodeType,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,mute: null == mute ? _self.mute : mute // ignore: cast_nullable_to_non_nullable
as bool,hasVolume: null == hasVolume ? _self.hasVolume : hasVolume // ignore: cast_nullable_to_non_nullable
as bool,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,module: freezed == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as PwModule?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NodeOwner?,linkGroup: freezed == linkGroup ? _self.linkGroup : linkGroup // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,resampleDisabled: null == resampleDisabled ? _self.resampleDisabled : resampleDisabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PwModuleCopyWith<$Res>? get module {
    if (_self.module == null) {
    return null;
  }

  return $PwModuleCopyWith<$Res>(_self.module!, (value) {
    return _then(_self.copyWith(module: value));
  });
}/// Create a copy of PwNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $NodeOwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
