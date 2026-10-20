// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwModule {

/// Module index in pactl, equal to the node's `pulse.module.id`.
 int get index;/// e.g. `module-remap-source`, `module-null-sink`.
 String get name;/// Creation arguments: `rate`, `channels`, `channel_map`, `master`, ...
 IMap<String, String> get arguments;
/// Create a copy of PwModule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwModuleCopyWith<PwModule> get copyWith => _$PwModuleCopyWithImpl<PwModule>(this as PwModule, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwModule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwModule&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.arguments, _this.arguments) || other.arguments == _this.arguments));
}


@override
int get hashCode {
  final _this = this as PwModule;
  return Object.hash(runtimeType,_this.index,_this.name,_this.arguments);
}

@override
String toString() {
  final _this = this as PwModule;
  return 'PwModule(index: ${_this.index}, name: ${_this.name}, arguments: ${_this.arguments})';
}


}

/// @nodoc
abstract mixin class $PwModuleCopyWith<$Res>  {
  factory $PwModuleCopyWith(PwModule value, $Res Function(PwModule) _then) = _$PwModuleCopyWithImpl;
@useResult
$Res call({
 int index, String name, IMap<String, String> arguments
});




}
/// @nodoc
class _$PwModuleCopyWithImpl<$Res>
    implements $PwModuleCopyWith<$Res> {
  _$PwModuleCopyWithImpl(this._self, this._then);

  final PwModule _self;
  final $Res Function(PwModule) _then;

/// Create a copy of PwModule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? arguments = null,}) {
  return _then(PwModule(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as IMap<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PwModule].
extension PwModulePatterns on PwModule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwModule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwModule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwModule value)  $default,){
final _that = this;
switch (_that) {
case _PwModule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwModule value)?  $default,){
final _that = this;
switch (_that) {
case _PwModule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  IMap<String, String> arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwModule() when $default != null:
return $default(_that.index,_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  IMap<String, String> arguments)  $default,) {final _that = this;
switch (_that) {
case _PwModule():
return $default(_that.index,_that.name,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  IMap<String, String> arguments)?  $default,) {final _that = this;
switch (_that) {
case _PwModule() when $default != null:
return $default(_that.index,_that.name,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc


class _PwModule implements PwModule {
  const _PwModule({required this.index, required this.name, this.arguments = const IMapConst<String, String>({})});
  

/// Module index in pactl, equal to the node's `pulse.module.id`.
@override final  int index;
/// e.g. `module-remap-source`, `module-null-sink`.
@override final  String name;
/// Creation arguments: `rate`, `channels`, `channel_map`, `master`, ...
@override@JsonKey() final  IMap<String, String> arguments;

/// Create a copy of PwModule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwModuleCopyWith<_PwModule> get copyWith => __$PwModuleCopyWithImpl<_PwModule>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwModule&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.arguments, arguments) || other.arguments == arguments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,index,name,arguments);
}

@override
String toString() {
    return 'PwModule(index: $index, name: $name, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$PwModuleCopyWith<$Res> implements $PwModuleCopyWith<$Res> {
  factory _$PwModuleCopyWith(_PwModule value, $Res Function(_PwModule) _then) = __$PwModuleCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, IMap<String, String> arguments
});




}
/// @nodoc
class __$PwModuleCopyWithImpl<$Res>
    implements _$PwModuleCopyWith<$Res> {
  __$PwModuleCopyWithImpl(this._self, this._then);

  final _PwModule _self;
  final $Res Function(_PwModule) _then;

/// Create a copy of PwModule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? arguments = null,}) {
  return _then(_PwModule(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as IMap<String, String>,
  ));
}


}

// dart format on
