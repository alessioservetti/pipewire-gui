// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwLink {

 int get id; int get outputNodeId; int get outputPortId; int get inputNodeId; int get inputPortId; bool get active;
/// Create a copy of PwLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwLinkCopyWith<PwLink> get copyWith => _$PwLinkCopyWithImpl<PwLink>(this as PwLink, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PwLink;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwLink&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.outputNodeId, _this.outputNodeId) || other.outputNodeId == _this.outputNodeId)&&(identical(other.outputPortId, _this.outputPortId) || other.outputPortId == _this.outputPortId)&&(identical(other.inputNodeId, _this.inputNodeId) || other.inputNodeId == _this.inputNodeId)&&(identical(other.inputPortId, _this.inputPortId) || other.inputPortId == _this.inputPortId)&&(identical(other.active, _this.active) || other.active == _this.active));
}


@override
int get hashCode {
  final _this = this as PwLink;
  return Object.hash(runtimeType,_this.id,_this.outputNodeId,_this.outputPortId,_this.inputNodeId,_this.inputPortId,_this.active);
}

@override
String toString() {
  final _this = this as PwLink;
  return 'PwLink(id: ${_this.id}, outputNodeId: ${_this.outputNodeId}, outputPortId: ${_this.outputPortId}, inputNodeId: ${_this.inputNodeId}, inputPortId: ${_this.inputPortId}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $PwLinkCopyWith<$Res>  {
  factory $PwLinkCopyWith(PwLink value, $Res Function(PwLink) _then) = _$PwLinkCopyWithImpl;
@useResult
$Res call({
 int id, int outputNodeId, int outputPortId, int inputNodeId, int inputPortId, bool active
});




}
/// @nodoc
class _$PwLinkCopyWithImpl<$Res>
    implements $PwLinkCopyWith<$Res> {
  _$PwLinkCopyWithImpl(this._self, this._then);

  final PwLink _self;
  final $Res Function(PwLink) _then;

/// Create a copy of PwLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? outputNodeId = null,Object? outputPortId = null,Object? inputNodeId = null,Object? inputPortId = null,Object? active = null,}) {
  return _then(PwLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,outputNodeId: null == outputNodeId ? _self.outputNodeId : outputNodeId // ignore: cast_nullable_to_non_nullable
as int,outputPortId: null == outputPortId ? _self.outputPortId : outputPortId // ignore: cast_nullable_to_non_nullable
as int,inputNodeId: null == inputNodeId ? _self.inputNodeId : inputNodeId // ignore: cast_nullable_to_non_nullable
as int,inputPortId: null == inputPortId ? _self.inputPortId : inputPortId // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PwLink].
extension PwLinkPatterns on PwLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwLink value)  $default,){
final _that = this;
switch (_that) {
case _PwLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwLink value)?  $default,){
final _that = this;
switch (_that) {
case _PwLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int outputNodeId,  int outputPortId,  int inputNodeId,  int inputPortId,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwLink() when $default != null:
return $default(_that.id,_that.outputNodeId,_that.outputPortId,_that.inputNodeId,_that.inputPortId,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int outputNodeId,  int outputPortId,  int inputNodeId,  int inputPortId,  bool active)  $default,) {final _that = this;
switch (_that) {
case _PwLink():
return $default(_that.id,_that.outputNodeId,_that.outputPortId,_that.inputNodeId,_that.inputPortId,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int outputNodeId,  int outputPortId,  int inputNodeId,  int inputPortId,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _PwLink() when $default != null:
return $default(_that.id,_that.outputNodeId,_that.outputPortId,_that.inputNodeId,_that.inputPortId,_that.active);case _:
  return null;

}
}

}

/// @nodoc


class _PwLink implements PwLink {
  const _PwLink({required this.id, required this.outputNodeId, required this.outputPortId, required this.inputNodeId, required this.inputPortId, this.active = true});
  

@override final  int id;
@override final  int outputNodeId;
@override final  int outputPortId;
@override final  int inputNodeId;
@override final  int inputPortId;
@override@JsonKey() final  bool active;

/// Create a copy of PwLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwLinkCopyWith<_PwLink> get copyWith => __$PwLinkCopyWithImpl<_PwLink>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwLink&&(identical(other.id, id) || other.id == id)&&(identical(other.outputNodeId, outputNodeId) || other.outputNodeId == outputNodeId)&&(identical(other.outputPortId, outputPortId) || other.outputPortId == outputPortId)&&(identical(other.inputNodeId, inputNodeId) || other.inputNodeId == inputNodeId)&&(identical(other.inputPortId, inputPortId) || other.inputPortId == inputPortId)&&(identical(other.active, active) || other.active == active));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,outputNodeId,outputPortId,inputNodeId,inputPortId,active);
}

@override
String toString() {
    return 'PwLink(id: $id, outputNodeId: $outputNodeId, outputPortId: $outputPortId, inputNodeId: $inputNodeId, inputPortId: $inputPortId, active: $active)';
}


}

/// @nodoc
abstract mixin class _$PwLinkCopyWith<$Res> implements $PwLinkCopyWith<$Res> {
  factory _$PwLinkCopyWith(_PwLink value, $Res Function(_PwLink) _then) = __$PwLinkCopyWithImpl;
@override @useResult
$Res call({
 int id, int outputNodeId, int outputPortId, int inputNodeId, int inputPortId, bool active
});




}
/// @nodoc
class __$PwLinkCopyWithImpl<$Res>
    implements _$PwLinkCopyWith<$Res> {
  __$PwLinkCopyWithImpl(this._self, this._then);

  final _PwLink _self;
  final $Res Function(_PwLink) _then;

/// Create a copy of PwLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? outputNodeId = null,Object? outputPortId = null,Object? inputNodeId = null,Object? inputPortId = null,Object? active = null,}) {
  return _then(_PwLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,outputNodeId: null == outputNodeId ? _self.outputNodeId : outputNodeId // ignore: cast_nullable_to_non_nullable
as int,outputPortId: null == outputPortId ? _self.outputPortId : outputPortId // ignore: cast_nullable_to_non_nullable
as int,inputNodeId: null == inputNodeId ? _self.inputNodeId : inputNodeId // ignore: cast_nullable_to_non_nullable
as int,inputPortId: null == inputPortId ? _self.inputPortId : inputPortId // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
