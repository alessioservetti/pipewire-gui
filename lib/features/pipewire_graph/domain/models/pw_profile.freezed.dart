// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwProfile {

 int get index; String get name; String get description; bool get available;
/// Create a copy of PwProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwProfileCopyWith<PwProfile> get copyWith => _$PwProfileCopyWithImpl<PwProfile>(this as PwProfile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwProfile&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.available, _this.available) || other.available == _this.available));
}


@override
int get hashCode {
  final _this = this as PwProfile;
  return Object.hash(runtimeType,_this.index,_this.name,_this.description,_this.available);
}

@override
String toString() {
  final _this = this as PwProfile;
  return 'PwProfile(index: ${_this.index}, name: ${_this.name}, description: ${_this.description}, available: ${_this.available})';
}


}

/// @nodoc
abstract mixin class $PwProfileCopyWith<$Res>  {
  factory $PwProfileCopyWith(PwProfile value, $Res Function(PwProfile) _then) = _$PwProfileCopyWithImpl;
@useResult
$Res call({
 int index, String name, String description, bool available
});




}
/// @nodoc
class _$PwProfileCopyWithImpl<$Res>
    implements $PwProfileCopyWith<$Res> {
  _$PwProfileCopyWithImpl(this._self, this._then);

  final PwProfile _self;
  final $Res Function(PwProfile) _then;

/// Create a copy of PwProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? description = null,Object? available = null,}) {
  return _then(PwProfile(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PwProfile].
extension PwProfilePatterns on PwProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwProfile value)  $default,){
final _that = this;
switch (_that) {
case _PwProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwProfile value)?  $default,){
final _that = this;
switch (_that) {
case _PwProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  String description,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwProfile() when $default != null:
return $default(_that.index,_that.name,_that.description,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  String description,  bool available)  $default,) {final _that = this;
switch (_that) {
case _PwProfile():
return $default(_that.index,_that.name,_that.description,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  String description,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _PwProfile() when $default != null:
return $default(_that.index,_that.name,_that.description,_that.available);case _:
  return null;

}
}

}

/// @nodoc


class _PwProfile implements PwProfile {
  const _PwProfile({required this.index, required this.name, required this.description, this.available = true});
  

@override final  int index;
@override final  String name;
@override final  String description;
@override@JsonKey() final  bool available;

/// Create a copy of PwProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwProfileCopyWith<_PwProfile> get copyWith => __$PwProfileCopyWithImpl<_PwProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwProfile&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.available, available) || other.available == available));
}


@override
int get hashCode {
    return Object.hash(runtimeType,index,name,description,available);
}

@override
String toString() {
    return 'PwProfile(index: $index, name: $name, description: $description, available: $available)';
}


}

/// @nodoc
abstract mixin class _$PwProfileCopyWith<$Res> implements $PwProfileCopyWith<$Res> {
  factory _$PwProfileCopyWith(_PwProfile value, $Res Function(_PwProfile) _then) = __$PwProfileCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, String description, bool available
});




}
/// @nodoc
class __$PwProfileCopyWithImpl<$Res>
    implements _$PwProfileCopyWith<$Res> {
  __$PwProfileCopyWithImpl(this._self, this._then);

  final _PwProfile _self;
  final $Res Function(_PwProfile) _then;

/// Create a copy of PwProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? description = null,Object? available = null,}) {
  return _then(_PwProfile(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
