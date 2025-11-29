// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreDTO {

 ContestantDTO get contestant; int get points;
/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDTOCopyWith<ScoreDTO> get copyWith => _$ScoreDTOCopyWithImpl<ScoreDTO>(this as ScoreDTO, _$identity);

  /// Serializes this ScoreDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDTO&&(identical(other.contestant, contestant) || other.contestant == contestant)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contestant,points);

@override
String toString() {
  return 'ScoreDTO(contestant: $contestant, points: $points)';
}


}

/// @nodoc
abstract mixin class $ScoreDTOCopyWith<$Res>  {
  factory $ScoreDTOCopyWith(ScoreDTO value, $Res Function(ScoreDTO) _then) = _$ScoreDTOCopyWithImpl;
@useResult
$Res call({
 ContestantDTO contestant, int points
});


$ContestantDTOCopyWith<$Res> get contestant;

}
/// @nodoc
class _$ScoreDTOCopyWithImpl<$Res>
    implements $ScoreDTOCopyWith<$Res> {
  _$ScoreDTOCopyWithImpl(this._self, this._then);

  final ScoreDTO _self;
  final $Res Function(ScoreDTO) _then;

/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contestant = null,Object? points = null,}) {
  return _then(_self.copyWith(
contestant: null == contestant ? _self.contestant : contestant // ignore: cast_nullable_to_non_nullable
as ContestantDTO,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContestantDTOCopyWith<$Res> get contestant {
  
  return $ContestantDTOCopyWith<$Res>(_self.contestant, (value) {
    return _then(_self.copyWith(contestant: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScoreDTO].
extension ScoreDTOPatterns on ScoreDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreDTO value)  $default,){
final _that = this;
switch (_that) {
case _ScoreDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContestantDTO contestant,  int points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreDTO() when $default != null:
return $default(_that.contestant,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContestantDTO contestant,  int points)  $default,) {final _that = this;
switch (_that) {
case _ScoreDTO():
return $default(_that.contestant,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContestantDTO contestant,  int points)?  $default,) {final _that = this;
switch (_that) {
case _ScoreDTO() when $default != null:
return $default(_that.contestant,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreDTO extends ScoreDTO {
  const _ScoreDTO({required this.contestant, required this.points}): super._();
  factory _ScoreDTO.fromJson(Map<String, dynamic> json) => _$ScoreDTOFromJson(json);

@override final  ContestantDTO contestant;
@override final  int points;

/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreDTOCopyWith<_ScoreDTO> get copyWith => __$ScoreDTOCopyWithImpl<_ScoreDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreDTO&&(identical(other.contestant, contestant) || other.contestant == contestant)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contestant,points);

@override
String toString() {
  return 'ScoreDTO(contestant: $contestant, points: $points)';
}


}

/// @nodoc
abstract mixin class _$ScoreDTOCopyWith<$Res> implements $ScoreDTOCopyWith<$Res> {
  factory _$ScoreDTOCopyWith(_ScoreDTO value, $Res Function(_ScoreDTO) _then) = __$ScoreDTOCopyWithImpl;
@override @useResult
$Res call({
 ContestantDTO contestant, int points
});


@override $ContestantDTOCopyWith<$Res> get contestant;

}
/// @nodoc
class __$ScoreDTOCopyWithImpl<$Res>
    implements _$ScoreDTOCopyWith<$Res> {
  __$ScoreDTOCopyWithImpl(this._self, this._then);

  final _ScoreDTO _self;
  final $Res Function(_ScoreDTO) _then;

/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contestant = null,Object? points = null,}) {
  return _then(_ScoreDTO(
contestant: null == contestant ? _self.contestant : contestant // ignore: cast_nullable_to_non_nullable
as ContestantDTO,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContestantDTOCopyWith<$Res> get contestant {
  
  return $ContestantDTOCopyWith<$Res>(_self.contestant, (value) {
    return _then(_self.copyWith(contestant: value));
  });
}
}

// dart format on
