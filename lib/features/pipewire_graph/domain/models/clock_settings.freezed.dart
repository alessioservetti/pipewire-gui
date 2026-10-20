// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClockSettings {

/// `clock.rate`: default graph rate, used when nothing asks for another one.
 int? get rate;/// `clock.allowed-rates`: rates the graph may switch to (when the driver is idle).
 IList<int> get allowedRates;/// `clock.force-rate`; null = automatic (0).
 int? get forceRate;/// `clock.quantum`: default buffer size in samples.
 int? get quantum;/// `clock.min-quantum`
 int? get minQuantum;/// `clock.max-quantum`
 int? get maxQuantum;/// `clock.force-quantum`; null = automatic (0).
 int? get forceQuantum;
/// Create a copy of ClockSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockSettingsCopyWith<ClockSettings> get copyWith => _$ClockSettingsCopyWithImpl<ClockSettings>(this as ClockSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClockSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockSettings&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&const DeepCollectionEquality().equals(other.allowedRates, _this.allowedRates)&&(identical(other.forceRate, _this.forceRate) || other.forceRate == _this.forceRate)&&(identical(other.quantum, _this.quantum) || other.quantum == _this.quantum)&&(identical(other.minQuantum, _this.minQuantum) || other.minQuantum == _this.minQuantum)&&(identical(other.maxQuantum, _this.maxQuantum) || other.maxQuantum == _this.maxQuantum)&&(identical(other.forceQuantum, _this.forceQuantum) || other.forceQuantum == _this.forceQuantum));
}


@override
int get hashCode {
  final _this = this as ClockSettings;
  return Object.hash(runtimeType,_this.rate,const DeepCollectionEquality().hash(_this.allowedRates),_this.forceRate,_this.quantum,_this.minQuantum,_this.maxQuantum,_this.forceQuantum);
}

@override
String toString() {
  final _this = this as ClockSettings;
  return 'ClockSettings(rate: ${_this.rate}, allowedRates: ${_this.allowedRates}, forceRate: ${_this.forceRate}, quantum: ${_this.quantum}, minQuantum: ${_this.minQuantum}, maxQuantum: ${_this.maxQuantum}, forceQuantum: ${_this.forceQuantum})';
}


}

/// @nodoc
abstract mixin class $ClockSettingsCopyWith<$Res>  {
  factory $ClockSettingsCopyWith(ClockSettings value, $Res Function(ClockSettings) _then) = _$ClockSettingsCopyWithImpl;
@useResult
$Res call({
 int? rate, IList<int> allowedRates, int? forceRate, int? quantum, int? minQuantum, int? maxQuantum, int? forceQuantum
});




}
/// @nodoc
class _$ClockSettingsCopyWithImpl<$Res>
    implements $ClockSettingsCopyWith<$Res> {
  _$ClockSettingsCopyWithImpl(this._self, this._then);

  final ClockSettings _self;
  final $Res Function(ClockSettings) _then;

/// Create a copy of ClockSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rate = freezed,Object? allowedRates = null,Object? forceRate = freezed,Object? quantum = freezed,Object? minQuantum = freezed,Object? maxQuantum = freezed,Object? forceQuantum = freezed,}) {
  return _then(ClockSettings(
rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,allowedRates: null == allowedRates ? _self.allowedRates : allowedRates // ignore: cast_nullable_to_non_nullable
as IList<int>,forceRate: freezed == forceRate ? _self.forceRate : forceRate // ignore: cast_nullable_to_non_nullable
as int?,quantum: freezed == quantum ? _self.quantum : quantum // ignore: cast_nullable_to_non_nullable
as int?,minQuantum: freezed == minQuantum ? _self.minQuantum : minQuantum // ignore: cast_nullable_to_non_nullable
as int?,maxQuantum: freezed == maxQuantum ? _self.maxQuantum : maxQuantum // ignore: cast_nullable_to_non_nullable
as int?,forceQuantum: freezed == forceQuantum ? _self.forceQuantum : forceQuantum // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockSettings].
extension ClockSettingsPatterns on ClockSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockSettings value)  $default,){
final _that = this;
switch (_that) {
case _ClockSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ClockSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? rate,  IList<int> allowedRates,  int? forceRate,  int? quantum,  int? minQuantum,  int? maxQuantum,  int? forceQuantum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockSettings() when $default != null:
return $default(_that.rate,_that.allowedRates,_that.forceRate,_that.quantum,_that.minQuantum,_that.maxQuantum,_that.forceQuantum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? rate,  IList<int> allowedRates,  int? forceRate,  int? quantum,  int? minQuantum,  int? maxQuantum,  int? forceQuantum)  $default,) {final _that = this;
switch (_that) {
case _ClockSettings():
return $default(_that.rate,_that.allowedRates,_that.forceRate,_that.quantum,_that.minQuantum,_that.maxQuantum,_that.forceQuantum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? rate,  IList<int> allowedRates,  int? forceRate,  int? quantum,  int? minQuantum,  int? maxQuantum,  int? forceQuantum)?  $default,) {final _that = this;
switch (_that) {
case _ClockSettings() when $default != null:
return $default(_that.rate,_that.allowedRates,_that.forceRate,_that.quantum,_that.minQuantum,_that.maxQuantum,_that.forceQuantum);case _:
  return null;

}
}

}

/// @nodoc


class _ClockSettings implements ClockSettings {
  const _ClockSettings({this.rate, this.allowedRates = const IListConst<int>([]), this.forceRate, this.quantum, this.minQuantum, this.maxQuantum, this.forceQuantum});
  

/// `clock.rate`: default graph rate, used when nothing asks for another one.
@override final  int? rate;
/// `clock.allowed-rates`: rates the graph may switch to (when the driver is idle).
@override@JsonKey() final  IList<int> allowedRates;
/// `clock.force-rate`; null = automatic (0).
@override final  int? forceRate;
/// `clock.quantum`: default buffer size in samples.
@override final  int? quantum;
/// `clock.min-quantum`
@override final  int? minQuantum;
/// `clock.max-quantum`
@override final  int? maxQuantum;
/// `clock.force-quantum`; null = automatic (0).
@override final  int? forceQuantum;

/// Create a copy of ClockSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockSettingsCopyWith<_ClockSettings> get copyWith => __$ClockSettingsCopyWithImpl<_ClockSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockSettings&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.allowedRates, allowedRates)&&(identical(other.forceRate, forceRate) || other.forceRate == forceRate)&&(identical(other.quantum, quantum) || other.quantum == quantum)&&(identical(other.minQuantum, minQuantum) || other.minQuantum == minQuantum)&&(identical(other.maxQuantum, maxQuantum) || other.maxQuantum == maxQuantum)&&(identical(other.forceQuantum, forceQuantum) || other.forceQuantum == forceQuantum));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rate,const DeepCollectionEquality().hash(allowedRates),forceRate,quantum,minQuantum,maxQuantum,forceQuantum);
}

@override
String toString() {
    return 'ClockSettings(rate: $rate, allowedRates: $allowedRates, forceRate: $forceRate, quantum: $quantum, minQuantum: $minQuantum, maxQuantum: $maxQuantum, forceQuantum: $forceQuantum)';
}


}

/// @nodoc
abstract mixin class _$ClockSettingsCopyWith<$Res> implements $ClockSettingsCopyWith<$Res> {
  factory _$ClockSettingsCopyWith(_ClockSettings value, $Res Function(_ClockSettings) _then) = __$ClockSettingsCopyWithImpl;
@override @useResult
$Res call({
 int? rate, IList<int> allowedRates, int? forceRate, int? quantum, int? minQuantum, int? maxQuantum, int? forceQuantum
});




}
/// @nodoc
class __$ClockSettingsCopyWithImpl<$Res>
    implements _$ClockSettingsCopyWith<$Res> {
  __$ClockSettingsCopyWithImpl(this._self, this._then);

  final _ClockSettings _self;
  final $Res Function(_ClockSettings) _then;

/// Create a copy of ClockSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rate = freezed,Object? allowedRates = null,Object? forceRate = freezed,Object? quantum = freezed,Object? minQuantum = freezed,Object? maxQuantum = freezed,Object? forceQuantum = freezed,}) {
  return _then(_ClockSettings(
rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,allowedRates: null == allowedRates ? _self.allowedRates : allowedRates // ignore: cast_nullable_to_non_nullable
as IList<int>,forceRate: freezed == forceRate ? _self.forceRate : forceRate // ignore: cast_nullable_to_non_nullable
as int?,quantum: freezed == quantum ? _self.quantum : quantum // ignore: cast_nullable_to_non_nullable
as int?,minQuantum: freezed == minQuantum ? _self.minQuantum : minQuantum // ignore: cast_nullable_to_non_nullable
as int?,maxQuantum: freezed == maxQuantum ? _self.maxQuantum : maxQuantum // ignore: cast_nullable_to_non_nullable
as int?,forceQuantum: freezed == forceQuantum ? _self.forceQuantum : forceQuantum // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
