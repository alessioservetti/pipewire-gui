// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patchbay_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatchbayNode {

 int get id;/// Identity across restarts, unlike [id]: `media.class|node.name` (`#2`, `#3`... for nodes
/// sharing both). Key of the saved position.
 String get key; String get title; PwNodeType get type;/// Effective sample rate, null for DSP nodes that follow the graph clock.
 int? get rate;/// `rate=` argument of the pactl module that created the node, if any.
 int? get requestedRate;/// Rate the audio actually flows at in the node's group (its driver's rate).
 int? get graphRate;/// The node resamples between [rate] and [graphRate].
 bool get resampling;/// The node has a volume to show and set. The value itself is not here (see [PatchbayView]):
/// the volume bar reads it on its own.
 bool get hasVolume;/// Default sink or default source (`default` metadata).
 bool get isDefault;/// What keeps the node alive (pactl module or pw-loopback process), null if the GUI cannot
/// remove it. Removing it removes every node with the same owner.
 NodeOwner? get owner; IList<PwPort> get inputs; IList<PwPort> get outputs;
/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchbayNodeCopyWith<PatchbayNode> get copyWith => _$PatchbayNodeCopyWithImpl<PatchbayNode>(this as PatchbayNode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PatchbayNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchbayNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.requestedRate, _this.requestedRate) || other.requestedRate == _this.requestedRate)&&(identical(other.graphRate, _this.graphRate) || other.graphRate == _this.graphRate)&&(identical(other.resampling, _this.resampling) || other.resampling == _this.resampling)&&(identical(other.hasVolume, _this.hasVolume) || other.hasVolume == _this.hasVolume)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault)&&(identical(other.owner, _this.owner) || other.owner == _this.owner)&&const DeepCollectionEquality().equals(other.inputs, _this.inputs)&&const DeepCollectionEquality().equals(other.outputs, _this.outputs));
}


@override
int get hashCode {
  final _this = this as PatchbayNode;
  return Object.hash(runtimeType,_this.id,_this.key,_this.title,_this.type,_this.rate,_this.requestedRate,_this.graphRate,_this.resampling,_this.hasVolume,_this.isDefault,_this.owner,const DeepCollectionEquality().hash(_this.inputs),const DeepCollectionEquality().hash(_this.outputs));
}

@override
String toString() {
  final _this = this as PatchbayNode;
  return 'PatchbayNode(id: ${_this.id}, key: ${_this.key}, title: ${_this.title}, type: ${_this.type}, rate: ${_this.rate}, requestedRate: ${_this.requestedRate}, graphRate: ${_this.graphRate}, resampling: ${_this.resampling}, hasVolume: ${_this.hasVolume}, isDefault: ${_this.isDefault}, owner: ${_this.owner}, inputs: ${_this.inputs}, outputs: ${_this.outputs})';
}


}

/// @nodoc
abstract mixin class $PatchbayNodeCopyWith<$Res>  {
  factory $PatchbayNodeCopyWith(PatchbayNode value, $Res Function(PatchbayNode) _then) = _$PatchbayNodeCopyWithImpl;
@useResult
$Res call({
 int id, String key, String title, PwNodeType type, int? rate, int? requestedRate, int? graphRate, bool resampling, bool hasVolume, bool isDefault, NodeOwner? owner, IList<PwPort> inputs, IList<PwPort> outputs
});


$NodeOwnerCopyWith<$Res>? get owner;

}
/// @nodoc
class _$PatchbayNodeCopyWithImpl<$Res>
    implements $PatchbayNodeCopyWith<$Res> {
  _$PatchbayNodeCopyWithImpl(this._self, this._then);

  final PatchbayNode _self;
  final $Res Function(PatchbayNode) _then;

/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? title = null,Object? type = null,Object? rate = freezed,Object? requestedRate = freezed,Object? graphRate = freezed,Object? resampling = null,Object? hasVolume = null,Object? isDefault = null,Object? owner = freezed,Object? inputs = null,Object? outputs = null,}) {
  return _then(PatchbayNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PwNodeType,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,requestedRate: freezed == requestedRate ? _self.requestedRate : requestedRate // ignore: cast_nullable_to_non_nullable
as int?,graphRate: freezed == graphRate ? _self.graphRate : graphRate // ignore: cast_nullable_to_non_nullable
as int?,resampling: null == resampling ? _self.resampling : resampling // ignore: cast_nullable_to_non_nullable
as bool,hasVolume: null == hasVolume ? _self.hasVolume : hasVolume // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NodeOwner?,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,
  ));
}
/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $NodeOwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatchbayNode].
extension PatchbayNodePatterns on PatchbayNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchbayNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchbayNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchbayNode value)  $default,){
final _that = this;
switch (_that) {
case _PatchbayNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchbayNode value)?  $default,){
final _that = this;
switch (_that) {
case _PatchbayNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String key,  String title,  PwNodeType type,  int? rate,  int? requestedRate,  int? graphRate,  bool resampling,  bool hasVolume,  bool isDefault,  NodeOwner? owner,  IList<PwPort> inputs,  IList<PwPort> outputs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchbayNode() when $default != null:
return $default(_that.id,_that.key,_that.title,_that.type,_that.rate,_that.requestedRate,_that.graphRate,_that.resampling,_that.hasVolume,_that.isDefault,_that.owner,_that.inputs,_that.outputs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String key,  String title,  PwNodeType type,  int? rate,  int? requestedRate,  int? graphRate,  bool resampling,  bool hasVolume,  bool isDefault,  NodeOwner? owner,  IList<PwPort> inputs,  IList<PwPort> outputs)  $default,) {final _that = this;
switch (_that) {
case _PatchbayNode():
return $default(_that.id,_that.key,_that.title,_that.type,_that.rate,_that.requestedRate,_that.graphRate,_that.resampling,_that.hasVolume,_that.isDefault,_that.owner,_that.inputs,_that.outputs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String key,  String title,  PwNodeType type,  int? rate,  int? requestedRate,  int? graphRate,  bool resampling,  bool hasVolume,  bool isDefault,  NodeOwner? owner,  IList<PwPort> inputs,  IList<PwPort> outputs)?  $default,) {final _that = this;
switch (_that) {
case _PatchbayNode() when $default != null:
return $default(_that.id,_that.key,_that.title,_that.type,_that.rate,_that.requestedRate,_that.graphRate,_that.resampling,_that.hasVolume,_that.isDefault,_that.owner,_that.inputs,_that.outputs);case _:
  return null;

}
}

}

/// @nodoc


class _PatchbayNode implements PatchbayNode {
  const _PatchbayNode({required this.id, required this.key, required this.title, required this.type, this.rate, this.requestedRate, this.graphRate, this.resampling = false, this.hasVolume = false, this.isDefault = false, this.owner, this.inputs = const IListConst<PwPort>([]), this.outputs = const IListConst<PwPort>([])});
  

@override final  int id;
/// Identity across restarts, unlike [id]: `media.class|node.name` (`#2`, `#3`... for nodes
/// sharing both). Key of the saved position.
@override final  String key;
@override final  String title;
@override final  PwNodeType type;
/// Effective sample rate, null for DSP nodes that follow the graph clock.
@override final  int? rate;
/// `rate=` argument of the pactl module that created the node, if any.
@override final  int? requestedRate;
/// Rate the audio actually flows at in the node's group (its driver's rate).
@override final  int? graphRate;
/// The node resamples between [rate] and [graphRate].
@override@JsonKey() final  bool resampling;
/// The node has a volume to show and set. The value itself is not here (see [PatchbayView]):
/// the volume bar reads it on its own.
@override@JsonKey() final  bool hasVolume;
/// Default sink or default source (`default` metadata).
@override@JsonKey() final  bool isDefault;
/// What keeps the node alive (pactl module or pw-loopback process), null if the GUI cannot
/// remove it. Removing it removes every node with the same owner.
@override final  NodeOwner? owner;
@override@JsonKey() final  IList<PwPort> inputs;
@override@JsonKey() final  IList<PwPort> outputs;

/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchbayNodeCopyWith<_PatchbayNode> get copyWith => __$PatchbayNodeCopyWithImpl<_PatchbayNode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchbayNode&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.requestedRate, requestedRate) || other.requestedRate == requestedRate)&&(identical(other.graphRate, graphRate) || other.graphRate == graphRate)&&(identical(other.resampling, resampling) || other.resampling == resampling)&&(identical(other.hasVolume, hasVolume) || other.hasVolume == hasVolume)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.inputs, inputs)&&const DeepCollectionEquality().equals(other.outputs, outputs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,key,title,type,rate,requestedRate,graphRate,resampling,hasVolume,isDefault,owner,const DeepCollectionEquality().hash(inputs),const DeepCollectionEquality().hash(outputs));
}

@override
String toString() {
    return 'PatchbayNode(id: $id, key: $key, title: $title, type: $type, rate: $rate, requestedRate: $requestedRate, graphRate: $graphRate, resampling: $resampling, hasVolume: $hasVolume, isDefault: $isDefault, owner: $owner, inputs: $inputs, outputs: $outputs)';
}


}

/// @nodoc
abstract mixin class _$PatchbayNodeCopyWith<$Res> implements $PatchbayNodeCopyWith<$Res> {
  factory _$PatchbayNodeCopyWith(_PatchbayNode value, $Res Function(_PatchbayNode) _then) = __$PatchbayNodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String key, String title, PwNodeType type, int? rate, int? requestedRate, int? graphRate, bool resampling, bool hasVolume, bool isDefault, NodeOwner? owner, IList<PwPort> inputs, IList<PwPort> outputs
});


@override $NodeOwnerCopyWith<$Res>? get owner;

}
/// @nodoc
class __$PatchbayNodeCopyWithImpl<$Res>
    implements _$PatchbayNodeCopyWith<$Res> {
  __$PatchbayNodeCopyWithImpl(this._self, this._then);

  final _PatchbayNode _self;
  final $Res Function(_PatchbayNode) _then;

/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? title = null,Object? type = null,Object? rate = freezed,Object? requestedRate = freezed,Object? graphRate = freezed,Object? resampling = null,Object? hasVolume = null,Object? isDefault = null,Object? owner = freezed,Object? inputs = null,Object? outputs = null,}) {
  return _then(_PatchbayNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PwNodeType,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int?,requestedRate: freezed == requestedRate ? _self.requestedRate : requestedRate // ignore: cast_nullable_to_non_nullable
as int?,graphRate: freezed == graphRate ? _self.graphRate : graphRate // ignore: cast_nullable_to_non_nullable
as int?,resampling: null == resampling ? _self.resampling : resampling // ignore: cast_nullable_to_non_nullable
as bool,hasVolume: null == hasVolume ? _self.hasVolume : hasVolume // ignore: cast_nullable_to_non_nullable
as bool,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NodeOwner?,inputs: null == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,outputs: null == outputs ? _self.outputs : outputs // ignore: cast_nullable_to_non_nullable
as IList<PwPort>,
  ));
}

/// Create a copy of PatchbayNode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $NodeOwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

/// @nodoc
mixin _$PatchbayView {

 IList<PatchbayNode> get nodes; IList<PwLink> get links; IList<InternalLink> get internalLinks;
/// Create a copy of PatchbayView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchbayViewCopyWith<PatchbayView> get copyWith => _$PatchbayViewCopyWithImpl<PatchbayView>(this as PatchbayView, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PatchbayView;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchbayView&&const DeepCollectionEquality().equals(other.nodes, _this.nodes)&&const DeepCollectionEquality().equals(other.links, _this.links)&&const DeepCollectionEquality().equals(other.internalLinks, _this.internalLinks));
}


@override
int get hashCode {
  final _this = this as PatchbayView;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.nodes),const DeepCollectionEquality().hash(_this.links),const DeepCollectionEquality().hash(_this.internalLinks));
}

@override
String toString() {
  final _this = this as PatchbayView;
  return 'PatchbayView(nodes: ${_this.nodes}, links: ${_this.links}, internalLinks: ${_this.internalLinks})';
}


}

/// @nodoc
abstract mixin class $PatchbayViewCopyWith<$Res>  {
  factory $PatchbayViewCopyWith(PatchbayView value, $Res Function(PatchbayView) _then) = _$PatchbayViewCopyWithImpl;
@useResult
$Res call({
 IList<PatchbayNode> nodes, IList<PwLink> links, IList<InternalLink> internalLinks
});




}
/// @nodoc
class _$PatchbayViewCopyWithImpl<$Res>
    implements $PatchbayViewCopyWith<$Res> {
  _$PatchbayViewCopyWithImpl(this._self, this._then);

  final PatchbayView _self;
  final $Res Function(PatchbayView) _then;

/// Create a copy of PatchbayView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodes = null,Object? links = null,Object? internalLinks = null,}) {
  return _then(PatchbayView(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as IList<PatchbayNode>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as IList<PwLink>,internalLinks: null == internalLinks ? _self.internalLinks : internalLinks // ignore: cast_nullable_to_non_nullable
as IList<InternalLink>,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchbayView].
extension PatchbayViewPatterns on PatchbayView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchbayView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchbayView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchbayView value)  $default,){
final _that = this;
switch (_that) {
case _PatchbayView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchbayView value)?  $default,){
final _that = this;
switch (_that) {
case _PatchbayView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IList<PatchbayNode> nodes,  IList<PwLink> links,  IList<InternalLink> internalLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchbayView() when $default != null:
return $default(_that.nodes,_that.links,_that.internalLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IList<PatchbayNode> nodes,  IList<PwLink> links,  IList<InternalLink> internalLinks)  $default,) {final _that = this;
switch (_that) {
case _PatchbayView():
return $default(_that.nodes,_that.links,_that.internalLinks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IList<PatchbayNode> nodes,  IList<PwLink> links,  IList<InternalLink> internalLinks)?  $default,) {final _that = this;
switch (_that) {
case _PatchbayView() when $default != null:
return $default(_that.nodes,_that.links,_that.internalLinks);case _:
  return null;

}
}

}

/// @nodoc


class _PatchbayView extends PatchbayView {
  const _PatchbayView({this.nodes = const IListConst<PatchbayNode>([]), this.links = const IListConst<PwLink>([]), this.internalLinks = const IListConst<InternalLink>([])}): super._();
  

@override@JsonKey() final  IList<PatchbayNode> nodes;
@override@JsonKey() final  IList<PwLink> links;
@override@JsonKey() final  IList<InternalLink> internalLinks;

/// Create a copy of PatchbayView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchbayViewCopyWith<_PatchbayView> get copyWith => __$PatchbayViewCopyWithImpl<_PatchbayView>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchbayView&&const DeepCollectionEquality().equals(other.nodes, nodes)&&const DeepCollectionEquality().equals(other.links, links)&&const DeepCollectionEquality().equals(other.internalLinks, internalLinks));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(nodes),const DeepCollectionEquality().hash(links),const DeepCollectionEquality().hash(internalLinks));
}

@override
String toString() {
    return 'PatchbayView(nodes: $nodes, links: $links, internalLinks: $internalLinks)';
}


}

/// @nodoc
abstract mixin class _$PatchbayViewCopyWith<$Res> implements $PatchbayViewCopyWith<$Res> {
  factory _$PatchbayViewCopyWith(_PatchbayView value, $Res Function(_PatchbayView) _then) = __$PatchbayViewCopyWithImpl;
@override @useResult
$Res call({
 IList<PatchbayNode> nodes, IList<PwLink> links, IList<InternalLink> internalLinks
});




}
/// @nodoc
class __$PatchbayViewCopyWithImpl<$Res>
    implements _$PatchbayViewCopyWith<$Res> {
  __$PatchbayViewCopyWithImpl(this._self, this._then);

  final _PatchbayView _self;
  final $Res Function(_PatchbayView) _then;

/// Create a copy of PatchbayView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodes = null,Object? links = null,Object? internalLinks = null,}) {
  return _then(_PatchbayView(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as IList<PatchbayNode>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as IList<PwLink>,internalLinks: null == internalLinks ? _self.internalLinks : internalLinks // ignore: cast_nullable_to_non_nullable
as IList<InternalLink>,
  ));
}


}

// dart format on
