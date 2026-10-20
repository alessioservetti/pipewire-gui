// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeOwner {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeOwner);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NodeOwner()';
}


}

/// @nodoc
class $NodeOwnerCopyWith<$Res>  {
$NodeOwnerCopyWith(NodeOwner _, $Res Function(NodeOwner) __);
}


/// Adds pattern-matching-related methods to [NodeOwner].
extension NodeOwnerPatterns on NodeOwner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ModuleOwner value)?  module,TResult Function( LoopbackProcessOwner value)?  loopbackProcess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ModuleOwner() when module != null:
return module(_that);case LoopbackProcessOwner() when loopbackProcess != null:
return loopbackProcess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ModuleOwner value)  module,required TResult Function( LoopbackProcessOwner value)  loopbackProcess,}){
final _that = this;
switch (_that) {
case ModuleOwner():
return module(_that);case LoopbackProcessOwner():
return loopbackProcess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ModuleOwner value)?  module,TResult? Function( LoopbackProcessOwner value)?  loopbackProcess,}){
final _that = this;
switch (_that) {
case ModuleOwner() when module != null:
return module(_that);case LoopbackProcessOwner() when loopbackProcess != null:
return loopbackProcess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PwModule module)?  module,TResult Function( int clientId,  int? processId)?  loopbackProcess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ModuleOwner() when module != null:
return module(_that.module);case LoopbackProcessOwner() when loopbackProcess != null:
return loopbackProcess(_that.clientId,_that.processId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PwModule module)  module,required TResult Function( int clientId,  int? processId)  loopbackProcess,}) {final _that = this;
switch (_that) {
case ModuleOwner():
return module(_that.module);case LoopbackProcessOwner():
return loopbackProcess(_that.clientId,_that.processId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PwModule module)?  module,TResult? Function( int clientId,  int? processId)?  loopbackProcess,}) {final _that = this;
switch (_that) {
case ModuleOwner() when module != null:
return module(_that.module);case LoopbackProcessOwner() when loopbackProcess != null:
return loopbackProcess(_that.clientId,_that.processId);case _:
  return null;

}
}

}

/// @nodoc


class ModuleOwner implements NodeOwner {
  const ModuleOwner(this.module);
  

 final  PwModule module;

/// Create a copy of NodeOwner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleOwnerCopyWith<ModuleOwner> get copyWith => _$ModuleOwnerCopyWithImpl<ModuleOwner>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleOwner&&(identical(other.module, module) || other.module == module));
}


@override
int get hashCode {
    return Object.hash(runtimeType,module);
}

@override
String toString() {
    return 'NodeOwner.module(module: $module)';
}


}

/// @nodoc
abstract mixin class $ModuleOwnerCopyWith<$Res> implements $NodeOwnerCopyWith<$Res> {
  factory $ModuleOwnerCopyWith(ModuleOwner value, $Res Function(ModuleOwner) _then) = _$ModuleOwnerCopyWithImpl;
@useResult
$Res call({
 PwModule module
});


$PwModuleCopyWith<$Res> get module;

}
/// @nodoc
class _$ModuleOwnerCopyWithImpl<$Res>
    implements $ModuleOwnerCopyWith<$Res> {
  _$ModuleOwnerCopyWithImpl(this._self, this._then);

  final ModuleOwner _self;
  final $Res Function(ModuleOwner) _then;

/// Create a copy of NodeOwner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? module = null,}) {
  return _then(ModuleOwner(
null == module ? _self.module : module // ignore: cast_nullable_to_non_nullable
as PwModule,
  ));
}

/// Create a copy of NodeOwner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PwModuleCopyWith<$Res> get module {
  
  return $PwModuleCopyWith<$Res>(_self.module, (value) {
    return _then(_self.copyWith(module: value));
  });
}
}

/// @nodoc


class LoopbackProcessOwner implements NodeOwner {
  const LoopbackProcessOwner({required this.clientId, this.processId});
  

 final  int clientId;
 final  int? processId;

/// Create a copy of NodeOwner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoopbackProcessOwnerCopyWith<LoopbackProcessOwner> get copyWith => _$LoopbackProcessOwnerCopyWithImpl<LoopbackProcessOwner>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoopbackProcessOwner&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.processId, processId) || other.processId == processId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,clientId,processId);
}

@override
String toString() {
    return 'NodeOwner.loopbackProcess(clientId: $clientId, processId: $processId)';
}


}

/// @nodoc
abstract mixin class $LoopbackProcessOwnerCopyWith<$Res> implements $NodeOwnerCopyWith<$Res> {
  factory $LoopbackProcessOwnerCopyWith(LoopbackProcessOwner value, $Res Function(LoopbackProcessOwner) _then) = _$LoopbackProcessOwnerCopyWithImpl;
@useResult
$Res call({
 int clientId, int? processId
});




}
/// @nodoc
class _$LoopbackProcessOwnerCopyWithImpl<$Res>
    implements $LoopbackProcessOwnerCopyWith<$Res> {
  _$LoopbackProcessOwnerCopyWithImpl(this._self, this._then);

  final LoopbackProcessOwner _self;
  final $Res Function(LoopbackProcessOwner) _then;

/// Create a copy of NodeOwner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? processId = freezed,}) {
  return _then(LoopbackProcessOwner(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as int,processId: freezed == processId ? _self.processId : processId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
