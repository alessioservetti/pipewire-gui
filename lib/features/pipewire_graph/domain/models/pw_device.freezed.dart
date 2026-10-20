// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwDevice {

 int get id; String get name; String get description; IList<PwProfile> get profiles; int? get activeProfileIndex;
/// Create a copy of PwDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwDeviceCopyWith<PwDevice> get copyWith => _$PwDeviceCopyWithImpl<PwDevice>(this as PwDevice, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwDevice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwDevice&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.profiles, _this.profiles)&&(identical(other.activeProfileIndex, _this.activeProfileIndex) || other.activeProfileIndex == _this.activeProfileIndex));
}


@override
int get hashCode {
  final _this = this as PwDevice;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,const DeepCollectionEquality().hash(_this.profiles),_this.activeProfileIndex);
}

@override
String toString() {
  final _this = this as PwDevice;
  return 'PwDevice(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, profiles: ${_this.profiles}, activeProfileIndex: ${_this.activeProfileIndex})';
}


}

/// @nodoc
abstract mixin class $PwDeviceCopyWith<$Res>  {
  factory $PwDeviceCopyWith(PwDevice value, $Res Function(PwDevice) _then) = _$PwDeviceCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, IList<PwProfile> profiles, int? activeProfileIndex
});




}
/// @nodoc
class _$PwDeviceCopyWithImpl<$Res>
    implements $PwDeviceCopyWith<$Res> {
  _$PwDeviceCopyWithImpl(this._self, this._then);

  final PwDevice _self;
  final $Res Function(PwDevice) _then;

/// Create a copy of PwDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? profiles = null,Object? activeProfileIndex = freezed,}) {
  return _then(PwDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as IList<PwProfile>,activeProfileIndex: freezed == activeProfileIndex ? _self.activeProfileIndex : activeProfileIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PwDevice].
extension PwDevicePatterns on PwDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwDevice value)  $default,){
final _that = this;
switch (_that) {
case _PwDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwDevice value)?  $default,){
final _that = this;
switch (_that) {
case _PwDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  IList<PwProfile> profiles,  int? activeProfileIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwDevice() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.profiles,_that.activeProfileIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  IList<PwProfile> profiles,  int? activeProfileIndex)  $default,) {final _that = this;
switch (_that) {
case _PwDevice():
return $default(_that.id,_that.name,_that.description,_that.profiles,_that.activeProfileIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  IList<PwProfile> profiles,  int? activeProfileIndex)?  $default,) {final _that = this;
switch (_that) {
case _PwDevice() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.profiles,_that.activeProfileIndex);case _:
  return null;

}
}

}

/// @nodoc


class _PwDevice implements PwDevice {
  const _PwDevice({required this.id, required this.name, required this.description, this.profiles = const IListConst<PwProfile>([]), this.activeProfileIndex});
  

@override final  int id;
@override final  String name;
@override final  String description;
@override@JsonKey() final  IList<PwProfile> profiles;
@override final  int? activeProfileIndex;

/// Create a copy of PwDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwDeviceCopyWith<_PwDevice> get copyWith => __$PwDeviceCopyWithImpl<_PwDevice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.profiles, profiles)&&(identical(other.activeProfileIndex, activeProfileIndex) || other.activeProfileIndex == activeProfileIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(profiles),activeProfileIndex);
}

@override
String toString() {
    return 'PwDevice(id: $id, name: $name, description: $description, profiles: $profiles, activeProfileIndex: $activeProfileIndex)';
}


}

/// @nodoc
abstract mixin class _$PwDeviceCopyWith<$Res> implements $PwDeviceCopyWith<$Res> {
  factory _$PwDeviceCopyWith(_PwDevice value, $Res Function(_PwDevice) _then) = __$PwDeviceCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, IList<PwProfile> profiles, int? activeProfileIndex
});




}
/// @nodoc
class __$PwDeviceCopyWithImpl<$Res>
    implements _$PwDeviceCopyWith<$Res> {
  __$PwDeviceCopyWithImpl(this._self, this._then);

  final _PwDevice _self;
  final $Res Function(_PwDevice) _then;

/// Create a copy of PwDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? profiles = null,Object? activeProfileIndex = freezed,}) {
  return _then(_PwDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as IList<PwProfile>,activeProfileIndex: freezed == activeProfileIndex ? _self.activeProfileIndex : activeProfileIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
