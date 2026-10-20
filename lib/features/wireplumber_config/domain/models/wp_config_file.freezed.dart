// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wp_config_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WpConfigFile {

 String get name; String get path;
/// Create a copy of WpConfigFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WpConfigFileCopyWith<WpConfigFile> get copyWith => _$WpConfigFileCopyWithImpl<WpConfigFile>(this as WpConfigFile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WpConfigFile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WpConfigFile&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.path, _this.path) || other.path == _this.path));
}


@override
int get hashCode {
  final _this = this as WpConfigFile;
  return Object.hash(runtimeType,_this.name,_this.path);
}

@override
String toString() {
  final _this = this as WpConfigFile;
  return 'WpConfigFile(name: ${_this.name}, path: ${_this.path})';
}


}

/// @nodoc
abstract mixin class $WpConfigFileCopyWith<$Res>  {
  factory $WpConfigFileCopyWith(WpConfigFile value, $Res Function(WpConfigFile) _then) = _$WpConfigFileCopyWithImpl;
@useResult
$Res call({
 String name, String path
});




}
/// @nodoc
class _$WpConfigFileCopyWithImpl<$Res>
    implements $WpConfigFileCopyWith<$Res> {
  _$WpConfigFileCopyWithImpl(this._self, this._then);

  final WpConfigFile _self;
  final $Res Function(WpConfigFile) _then;

/// Create a copy of WpConfigFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? path = null,}) {
  return _then(WpConfigFile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WpConfigFile].
extension WpConfigFilePatterns on WpConfigFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WpConfigFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WpConfigFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WpConfigFile value)  $default,){
final _that = this;
switch (_that) {
case _WpConfigFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WpConfigFile value)?  $default,){
final _that = this;
switch (_that) {
case _WpConfigFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WpConfigFile() when $default != null:
return $default(_that.name,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String path)  $default,) {final _that = this;
switch (_that) {
case _WpConfigFile():
return $default(_that.name,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String path)?  $default,) {final _that = this;
switch (_that) {
case _WpConfigFile() when $default != null:
return $default(_that.name,_that.path);case _:
  return null;

}
}

}

/// @nodoc


class _WpConfigFile implements WpConfigFile {
  const _WpConfigFile({required this.name, required this.path});
  

@override final  String name;
@override final  String path;

/// Create a copy of WpConfigFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WpConfigFileCopyWith<_WpConfigFile> get copyWith => __$WpConfigFileCopyWithImpl<_WpConfigFile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WpConfigFile&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,path);
}

@override
String toString() {
    return 'WpConfigFile(name: $name, path: $path)';
}


}

/// @nodoc
abstract mixin class _$WpConfigFileCopyWith<$Res> implements $WpConfigFileCopyWith<$Res> {
  factory _$WpConfigFileCopyWith(_WpConfigFile value, $Res Function(_WpConfigFile) _then) = __$WpConfigFileCopyWithImpl;
@override @useResult
$Res call({
 String name, String path
});




}
/// @nodoc
class __$WpConfigFileCopyWithImpl<$Res>
    implements _$WpConfigFileCopyWith<$Res> {
  __$WpConfigFileCopyWithImpl(this._self, this._then);

  final _WpConfigFile _self;
  final $Res Function(_WpConfigFile) _then;

/// Create a copy of WpConfigFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? path = null,}) {
  return _then(_WpConfigFile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
