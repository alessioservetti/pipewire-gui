// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwPort {

 int get id; int get nodeId;/// `port.name`
 String get name; PortDirection get direction;/// `port.id`: position among the node's ports of the same direction.
 int get index;/// From `format.dsp` ("32 bit float mono audio", "8 bit raw midi", ...).
 PortMediaType get mediaType;/// `audio.channel` (FL, FR, ...), null for MIDI/video.
 String? get channel;
/// Create a copy of PwPort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwPortCopyWith<PwPort> get copyWith => _$PwPortCopyWithImpl<PwPort>(this as PwPort, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwPort;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwPort&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.nodeId, _this.nodeId) || other.nodeId == _this.nodeId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.direction, _this.direction) || other.direction == _this.direction)&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.channel, _this.channel) || other.channel == _this.channel));
}


@override
int get hashCode {
  final _this = this as PwPort;
  return Object.hash(runtimeType,_this.id,_this.nodeId,_this.name,_this.direction,_this.index,_this.mediaType,_this.channel);
}

@override
String toString() {
  final _this = this as PwPort;
  return 'PwPort(id: ${_this.id}, nodeId: ${_this.nodeId}, name: ${_this.name}, direction: ${_this.direction}, index: ${_this.index}, mediaType: ${_this.mediaType}, channel: ${_this.channel})';
}


}

/// @nodoc
abstract mixin class $PwPortCopyWith<$Res>  {
  factory $PwPortCopyWith(PwPort value, $Res Function(PwPort) _then) = _$PwPortCopyWithImpl;
@useResult
$Res call({
 int id, int nodeId, String name, PortDirection direction, int index, PortMediaType mediaType, String? channel
});




}
/// @nodoc
class _$PwPortCopyWithImpl<$Res>
    implements $PwPortCopyWith<$Res> {
  _$PwPortCopyWithImpl(this._self, this._then);

  final PwPort _self;
  final $Res Function(PwPort) _then;

/// Create a copy of PwPort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nodeId = null,Object? name = null,Object? direction = null,Object? index = null,Object? mediaType = null,Object? channel = freezed,}) {
  return _then(PwPort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as PortDirection,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as PortMediaType,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PwPort].
extension PwPortPatterns on PwPort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwPort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwPort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwPort value)  $default,){
final _that = this;
switch (_that) {
case _PwPort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwPort value)?  $default,){
final _that = this;
switch (_that) {
case _PwPort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int nodeId,  String name,  PortDirection direction,  int index,  PortMediaType mediaType,  String? channel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwPort() when $default != null:
return $default(_that.id,_that.nodeId,_that.name,_that.direction,_that.index,_that.mediaType,_that.channel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int nodeId,  String name,  PortDirection direction,  int index,  PortMediaType mediaType,  String? channel)  $default,) {final _that = this;
switch (_that) {
case _PwPort():
return $default(_that.id,_that.nodeId,_that.name,_that.direction,_that.index,_that.mediaType,_that.channel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int nodeId,  String name,  PortDirection direction,  int index,  PortMediaType mediaType,  String? channel)?  $default,) {final _that = this;
switch (_that) {
case _PwPort() when $default != null:
return $default(_that.id,_that.nodeId,_that.name,_that.direction,_that.index,_that.mediaType,_that.channel);case _:
  return null;

}
}

}

/// @nodoc


class _PwPort implements PwPort {
  const _PwPort({required this.id, required this.nodeId, required this.name, required this.direction, this.index = 0, this.mediaType = PortMediaType.other, this.channel});
  

@override final  int id;
@override final  int nodeId;
/// `port.name`
@override final  String name;
@override final  PortDirection direction;
/// `port.id`: position among the node's ports of the same direction.
@override@JsonKey() final  int index;
/// From `format.dsp` ("32 bit float mono audio", "8 bit raw midi", ...).
@override@JsonKey() final  PortMediaType mediaType;
/// `audio.channel` (FL, FR, ...), null for MIDI/video.
@override final  String? channel;

/// Create a copy of PwPort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwPortCopyWith<_PwPort> get copyWith => __$PwPortCopyWithImpl<_PwPort>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwPort&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.index, index) || other.index == index)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,nodeId,name,direction,index,mediaType,channel);
}

@override
String toString() {
    return 'PwPort(id: $id, nodeId: $nodeId, name: $name, direction: $direction, index: $index, mediaType: $mediaType, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$PwPortCopyWith<$Res> implements $PwPortCopyWith<$Res> {
  factory _$PwPortCopyWith(_PwPort value, $Res Function(_PwPort) _then) = __$PwPortCopyWithImpl;
@override @useResult
$Res call({
 int id, int nodeId, String name, PortDirection direction, int index, PortMediaType mediaType, String? channel
});




}
/// @nodoc
class __$PwPortCopyWithImpl<$Res>
    implements _$PwPortCopyWith<$Res> {
  __$PwPortCopyWithImpl(this._self, this._then);

  final _PwPort _self;
  final $Res Function(_PwPort) _then;

/// Create a copy of PwPort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nodeId = null,Object? name = null,Object? direction = null,Object? index = null,Object? mediaType = null,Object? channel = freezed,}) {
  return _then(_PwPort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as PortDirection,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as PortMediaType,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
