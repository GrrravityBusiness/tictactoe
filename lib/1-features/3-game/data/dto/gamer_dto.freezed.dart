// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GamerDTO {

 String get name; XorODTO get symbol;@JsonKey(name: 'isMainContestant') bool get isMainPLayer;
/// Create a copy of GamerDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamerDTOCopyWith<GamerDTO> get copyWith => _$GamerDTOCopyWithImpl<GamerDTO>(this as GamerDTO, _$identity);

  /// Serializes this GamerDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamerDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isMainPLayer, isMainPLayer) || other.isMainPLayer == isMainPLayer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,symbol,isMainPLayer);

@override
String toString() {
  return 'GamerDTO(name: $name, symbol: $symbol, isMainPLayer: $isMainPLayer)';
}


}

/// @nodoc
abstract mixin class $GamerDTOCopyWith<$Res>  {
  factory $GamerDTOCopyWith(GamerDTO value, $Res Function(GamerDTO) _then) = _$GamerDTOCopyWithImpl;
@useResult
$Res call({
 String name, XorODTO symbol,@JsonKey(name: 'isMainContestant') bool isMainPLayer
});




}
/// @nodoc
class _$GamerDTOCopyWithImpl<$Res>
    implements $GamerDTOCopyWith<$Res> {
  _$GamerDTOCopyWithImpl(this._self, this._then);

  final GamerDTO _self;
  final $Res Function(GamerDTO) _then;

/// Create a copy of GamerDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? symbol = null,Object? isMainPLayer = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as XorODTO,isMainPLayer: null == isMainPLayer ? _self.isMainPLayer : isMainPLayer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GamerDTO].
extension GamerDTOPatterns on GamerDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamerDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamerDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamerDTO value)  $default,){
final _that = this;
switch (_that) {
case _GamerDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamerDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GamerDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  XorODTO symbol, @JsonKey(name: 'isMainContestant')  bool isMainPLayer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamerDTO() when $default != null:
return $default(_that.name,_that.symbol,_that.isMainPLayer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  XorODTO symbol, @JsonKey(name: 'isMainContestant')  bool isMainPLayer)  $default,) {final _that = this;
switch (_that) {
case _GamerDTO():
return $default(_that.name,_that.symbol,_that.isMainPLayer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  XorODTO symbol, @JsonKey(name: 'isMainContestant')  bool isMainPLayer)?  $default,) {final _that = this;
switch (_that) {
case _GamerDTO() when $default != null:
return $default(_that.name,_that.symbol,_that.isMainPLayer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GamerDTO extends GamerDTO {
  const _GamerDTO({required this.name, required this.symbol, @JsonKey(name: 'isMainContestant') required this.isMainPLayer}): super._();
  factory _GamerDTO.fromJson(Map<String, dynamic> json) => _$GamerDTOFromJson(json);

@override final  String name;
@override final  XorODTO symbol;
@override@JsonKey(name: 'isMainContestant') final  bool isMainPLayer;

/// Create a copy of GamerDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamerDTOCopyWith<_GamerDTO> get copyWith => __$GamerDTOCopyWithImpl<_GamerDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GamerDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamerDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isMainPLayer, isMainPLayer) || other.isMainPLayer == isMainPLayer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,symbol,isMainPLayer);

@override
String toString() {
  return 'GamerDTO(name: $name, symbol: $symbol, isMainPLayer: $isMainPLayer)';
}


}

/// @nodoc
abstract mixin class _$GamerDTOCopyWith<$Res> implements $GamerDTOCopyWith<$Res> {
  factory _$GamerDTOCopyWith(_GamerDTO value, $Res Function(_GamerDTO) _then) = __$GamerDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, XorODTO symbol,@JsonKey(name: 'isMainContestant') bool isMainPLayer
});




}
/// @nodoc
class __$GamerDTOCopyWithImpl<$Res>
    implements _$GamerDTOCopyWith<$Res> {
  __$GamerDTOCopyWithImpl(this._self, this._then);

  final _GamerDTO _self;
  final $Res Function(_GamerDTO) _then;

/// Create a copy of GamerDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? symbol = null,Object? isMainPLayer = null,}) {
  return _then(_GamerDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as XorODTO,isMainPLayer: null == isMainPLayer ? _self.isMainPLayer : isMainPLayer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
