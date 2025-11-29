// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamer_score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GamerScoreDTO {

@JsonKey(name: 'contestant') GamerDTO get gamer;@JsonKey(name: 'points') int get points;
/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamerScoreDTOCopyWith<GamerScoreDTO> get copyWith => _$GamerScoreDTOCopyWithImpl<GamerScoreDTO>(this as GamerScoreDTO, _$identity);

  /// Serializes this GamerScoreDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamerScoreDTO&&(identical(other.gamer, gamer) || other.gamer == gamer)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gamer,points);

@override
String toString() {
  return 'GamerScoreDTO(gamer: $gamer, points: $points)';
}


}

/// @nodoc
abstract mixin class $GamerScoreDTOCopyWith<$Res>  {
  factory $GamerScoreDTOCopyWith(GamerScoreDTO value, $Res Function(GamerScoreDTO) _then) = _$GamerScoreDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'contestant') GamerDTO gamer,@JsonKey(name: 'points') int points
});


$GamerDTOCopyWith<$Res> get gamer;

}
/// @nodoc
class _$GamerScoreDTOCopyWithImpl<$Res>
    implements $GamerScoreDTOCopyWith<$Res> {
  _$GamerScoreDTOCopyWithImpl(this._self, this._then);

  final GamerScoreDTO _self;
  final $Res Function(GamerScoreDTO) _then;

/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gamer = null,Object? points = null,}) {
  return _then(_self.copyWith(
gamer: null == gamer ? _self.gamer : gamer // ignore: cast_nullable_to_non_nullable
as GamerDTO,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerDTOCopyWith<$Res> get gamer {
  
  return $GamerDTOCopyWith<$Res>(_self.gamer, (value) {
    return _then(_self.copyWith(gamer: value));
  });
}
}


/// Adds pattern-matching-related methods to [GamerScoreDTO].
extension GamerScoreDTOPatterns on GamerScoreDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamerScoreDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamerScoreDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamerScoreDTO value)  $default,){
final _that = this;
switch (_that) {
case _GamerScoreDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamerScoreDTO value)?  $default,){
final _that = this;
switch (_that) {
case _GamerScoreDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'contestant')  GamerDTO gamer, @JsonKey(name: 'points')  int points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamerScoreDTO() when $default != null:
return $default(_that.gamer,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'contestant')  GamerDTO gamer, @JsonKey(name: 'points')  int points)  $default,) {final _that = this;
switch (_that) {
case _GamerScoreDTO():
return $default(_that.gamer,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'contestant')  GamerDTO gamer, @JsonKey(name: 'points')  int points)?  $default,) {final _that = this;
switch (_that) {
case _GamerScoreDTO() when $default != null:
return $default(_that.gamer,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GamerScoreDTO extends GamerScoreDTO {
  const _GamerScoreDTO({@JsonKey(name: 'contestant') required this.gamer, @JsonKey(name: 'points') required this.points}): super._();
  factory _GamerScoreDTO.fromJson(Map<String, dynamic> json) => _$GamerScoreDTOFromJson(json);

@override@JsonKey(name: 'contestant') final  GamerDTO gamer;
@override@JsonKey(name: 'points') final  int points;

/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamerScoreDTOCopyWith<_GamerScoreDTO> get copyWith => __$GamerScoreDTOCopyWithImpl<_GamerScoreDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GamerScoreDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamerScoreDTO&&(identical(other.gamer, gamer) || other.gamer == gamer)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gamer,points);

@override
String toString() {
  return 'GamerScoreDTO(gamer: $gamer, points: $points)';
}


}

/// @nodoc
abstract mixin class _$GamerScoreDTOCopyWith<$Res> implements $GamerScoreDTOCopyWith<$Res> {
  factory _$GamerScoreDTOCopyWith(_GamerScoreDTO value, $Res Function(_GamerScoreDTO) _then) = __$GamerScoreDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'contestant') GamerDTO gamer,@JsonKey(name: 'points') int points
});


@override $GamerDTOCopyWith<$Res> get gamer;

}
/// @nodoc
class __$GamerScoreDTOCopyWithImpl<$Res>
    implements _$GamerScoreDTOCopyWith<$Res> {
  __$GamerScoreDTOCopyWithImpl(this._self, this._then);

  final _GamerScoreDTO _self;
  final $Res Function(_GamerScoreDTO) _then;

/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gamer = null,Object? points = null,}) {
  return _then(_GamerScoreDTO(
gamer: null == gamer ? _self.gamer : gamer // ignore: cast_nullable_to_non_nullable
as GamerDTO,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GamerScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerDTOCopyWith<$Res> get gamer {
  
  return $GamerDTOCopyWith<$Res>(_self.gamer, (value) {
    return _then(_self.copyWith(gamer: value));
  });
}
}

// dart format on
