// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_object_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PwObjectDto {

 int get id;/// See PwObjectType.
 String get type;/// Node/Device/Port/Link data: `info.props`, `info.params`, `info.direction`,
/// `info.output-port-id`, ...
 Map<String, dynamic>? get info;/// Metadata objects only: `props["metadata.name"]`.
 Map<String, dynamic>? get props;/// Metadata objects only: entries `{subject, key, type, value}`.
 List<Map<String, dynamic>>? get metadata;
/// Create a copy of PwObjectDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwObjectDtoCopyWith<PwObjectDto> get copyWith => _$PwObjectDtoCopyWithImpl<PwObjectDto>(this as PwObjectDto, _$identity);

  /// Serializes this PwObjectDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PwObjectDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwObjectDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.info, _this.info)&&const DeepCollectionEquality().equals(other.props, _this.props)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PwObjectDto;
  return Object.hash(runtimeType,_this.id,_this.type,const DeepCollectionEquality().hash(_this.info),const DeepCollectionEquality().hash(_this.props),const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as PwObjectDto;
  return 'PwObjectDto(id: ${_this.id}, type: ${_this.type}, info: ${_this.info}, props: ${_this.props}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $PwObjectDtoCopyWith<$Res>  {
  factory $PwObjectDtoCopyWith(PwObjectDto value, $Res Function(PwObjectDto) _then) = _$PwObjectDtoCopyWithImpl;
@useResult
$Res call({
 int id, String type, Map<String, dynamic>? info, Map<String, dynamic>? props, List<Map<String, dynamic>>? metadata
});




}
/// @nodoc
class _$PwObjectDtoCopyWithImpl<$Res>
    implements $PwObjectDtoCopyWith<$Res> {
  _$PwObjectDtoCopyWithImpl(this._self, this._then);

  final PwObjectDto _self;
  final $Res Function(PwObjectDto) _then;

/// Create a copy of PwObjectDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? info = freezed,Object? props = freezed,Object? metadata = freezed,}) {
  return _then(PwObjectDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,props: freezed == props ? _self.props : props // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PwObjectDto].
extension PwObjectDtoPatterns on PwObjectDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwObjectDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwObjectDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwObjectDto value)  $default,){
final _that = this;
switch (_that) {
case _PwObjectDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwObjectDto value)?  $default,){
final _that = this;
switch (_that) {
case _PwObjectDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String type,  Map<String, dynamic>? info,  Map<String, dynamic>? props,  List<Map<String, dynamic>>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwObjectDto() when $default != null:
return $default(_that.id,_that.type,_that.info,_that.props,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String type,  Map<String, dynamic>? info,  Map<String, dynamic>? props,  List<Map<String, dynamic>>? metadata)  $default,) {final _that = this;
switch (_that) {
case _PwObjectDto():
return $default(_that.id,_that.type,_that.info,_that.props,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String type,  Map<String, dynamic>? info,  Map<String, dynamic>? props,  List<Map<String, dynamic>>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _PwObjectDto() when $default != null:
return $default(_that.id,_that.type,_that.info,_that.props,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PwObjectDto implements PwObjectDto {
  const _PwObjectDto({required this.id, required this.type,  Map<String, dynamic>? info,  Map<String, dynamic>? props,  List<Map<String, dynamic>>? metadata}): _info = info,_props = props,_metadata = metadata;
  factory _PwObjectDto.fromJson(Map<String, dynamic> json) => _$PwObjectDtoFromJson(json);

@override final  int id;
/// See PwObjectType.
@override final  String type;
/// Node/Device/Port/Link data: `info.props`, `info.params`, `info.direction`,
/// `info.output-port-id`, ...
 final  Map<String, dynamic>? _info;
/// Node/Device/Port/Link data: `info.props`, `info.params`, `info.direction`,
/// `info.output-port-id`, ...
@override Map<String, dynamic>? get info {
  final value = _info;
  if (value == null) return null;
  if (_info is EqualUnmodifiableMapView) return _info;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Metadata objects only: `props["metadata.name"]`.
 final  Map<String, dynamic>? _props;
/// Metadata objects only: `props["metadata.name"]`.
@override Map<String, dynamic>? get props {
  final value = _props;
  if (value == null) return null;
  if (_props is EqualUnmodifiableMapView) return _props;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Metadata objects only: entries `{subject, key, type, value}`.
 final  List<Map<String, dynamic>>? _metadata;
/// Metadata objects only: entries `{subject, key, type, value}`.
@override List<Map<String, dynamic>>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableListView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PwObjectDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwObjectDtoCopyWith<_PwObjectDto> get copyWith => __$PwObjectDtoCopyWithImpl<_PwObjectDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PwObjectDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwObjectDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.info, _info)&&const DeepCollectionEquality().equals(other.props, _props)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(_info),const DeepCollectionEquality().hash(_props),const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'PwObjectDto(id: $id, type: $type, info: $info, props: $props, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PwObjectDtoCopyWith<$Res> implements $PwObjectDtoCopyWith<$Res> {
  factory _$PwObjectDtoCopyWith(_PwObjectDto value, $Res Function(_PwObjectDto) _then) = __$PwObjectDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String type, Map<String, dynamic>? info, Map<String, dynamic>? props, List<Map<String, dynamic>>? metadata
});




}
/// @nodoc
class __$PwObjectDtoCopyWithImpl<$Res>
    implements _$PwObjectDtoCopyWith<$Res> {
  __$PwObjectDtoCopyWithImpl(this._self, this._then);

  final _PwObjectDto _self;
  final $Res Function(_PwObjectDto) _then;

/// Create a copy of PwObjectDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? info = freezed,Object? props = freezed,Object? metadata = freezed,}) {
  return _then(_PwObjectDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,info: freezed == info ? _self._info : info // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,props: freezed == props ? _self._props : props // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

// dart format on
