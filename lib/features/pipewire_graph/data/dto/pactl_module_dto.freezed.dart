// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pactl_module_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PactlModuleDto {

 int get index; String get name;/// Raw argument string, e.g. `source_name=X master=Y.monitor rate=48000`.
 String get argument;
/// Create a copy of PactlModuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PactlModuleDtoCopyWith<PactlModuleDto> get copyWith => _$PactlModuleDtoCopyWithImpl<PactlModuleDto>(this as PactlModuleDto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PactlModuleDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PactlModuleDto&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.argument, _this.argument) || other.argument == _this.argument));
}


@override
int get hashCode {
  final _this = this as PactlModuleDto;
  return Object.hash(runtimeType,_this.index,_this.name,_this.argument);
}

@override
String toString() {
  final _this = this as PactlModuleDto;
  return 'PactlModuleDto(index: ${_this.index}, name: ${_this.name}, argument: ${_this.argument})';
}


}

/// @nodoc
abstract mixin class $PactlModuleDtoCopyWith<$Res>  {
  factory $PactlModuleDtoCopyWith(PactlModuleDto value, $Res Function(PactlModuleDto) _then) = _$PactlModuleDtoCopyWithImpl;
@useResult
$Res call({
 int index, String name, String argument
});




}
/// @nodoc
class _$PactlModuleDtoCopyWithImpl<$Res>
    implements $PactlModuleDtoCopyWith<$Res> {
  _$PactlModuleDtoCopyWithImpl(this._self, this._then);

  final PactlModuleDto _self;
  final $Res Function(PactlModuleDto) _then;

/// Create a copy of PactlModuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? argument = null,}) {
  return _then(PactlModuleDto(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,argument: null == argument ? _self.argument : argument // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PactlModuleDto].
extension PactlModuleDtoPatterns on PactlModuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PactlModuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PactlModuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PactlModuleDto value)  $default,){
final _that = this;
switch (_that) {
case _PactlModuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PactlModuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _PactlModuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  String argument)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PactlModuleDto() when $default != null:
return $default(_that.index,_that.name,_that.argument);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  String argument)  $default,) {final _that = this;
switch (_that) {
case _PactlModuleDto():
return $default(_that.index,_that.name,_that.argument);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  String argument)?  $default,) {final _that = this;
switch (_that) {
case _PactlModuleDto() when $default != null:
return $default(_that.index,_that.name,_that.argument);case _:
  return null;

}
}

}

/// @nodoc


class _PactlModuleDto implements PactlModuleDto {
  const _PactlModuleDto({required this.index, required this.name, required this.argument});
  

@override final  int index;
@override final  String name;
/// Raw argument string, e.g. `source_name=X master=Y.monitor rate=48000`.
@override final  String argument;

/// Create a copy of PactlModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PactlModuleDtoCopyWith<_PactlModuleDto> get copyWith => __$PactlModuleDtoCopyWithImpl<_PactlModuleDto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PactlModuleDto&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.argument, argument) || other.argument == argument));
}


@override
int get hashCode {
    return Object.hash(runtimeType,index,name,argument);
}

@override
String toString() {
    return 'PactlModuleDto(index: $index, name: $name, argument: $argument)';
}


}

/// @nodoc
abstract mixin class _$PactlModuleDtoCopyWith<$Res> implements $PactlModuleDtoCopyWith<$Res> {
  factory _$PactlModuleDtoCopyWith(_PactlModuleDto value, $Res Function(_PactlModuleDto) _then) = __$PactlModuleDtoCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, String argument
});




}
/// @nodoc
class __$PactlModuleDtoCopyWithImpl<$Res>
    implements _$PactlModuleDtoCopyWith<$Res> {
  __$PactlModuleDtoCopyWithImpl(this._self, this._then);

  final _PactlModuleDto _self;
  final $Res Function(_PactlModuleDto) _then;

/// Create a copy of PactlModuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? argument = null,}) {
  return _then(_PactlModuleDto(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,argument: null == argument ? _self.argument : argument // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
