// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinalScoreDTO {

@JsonKey(name: 'playerScore') GamerScoreDTO get mainPlayerScore;@JsonKey(name: 'opponentScore') GamerScoreDTO get opponentScore;
/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinalScoreDTOCopyWith<FinalScoreDTO> get copyWith => _$FinalScoreDTOCopyWithImpl<FinalScoreDTO>(this as FinalScoreDTO, _$identity);

  /// Serializes this FinalScoreDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinalScoreDTO&&(identical(other.mainPlayerScore, mainPlayerScore) || other.mainPlayerScore == mainPlayerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainPlayerScore,opponentScore);

@override
String toString() {
  return 'FinalScoreDTO(mainPlayerScore: $mainPlayerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class $FinalScoreDTOCopyWith<$Res>  {
  factory $FinalScoreDTOCopyWith(FinalScoreDTO value, $Res Function(FinalScoreDTO) _then) = _$FinalScoreDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'playerScore') GamerScoreDTO mainPlayerScore,@JsonKey(name: 'opponentScore') GamerScoreDTO opponentScore
});


$GamerScoreDTOCopyWith<$Res> get mainPlayerScore;$GamerScoreDTOCopyWith<$Res> get opponentScore;

}
/// @nodoc
class _$FinalScoreDTOCopyWithImpl<$Res>
    implements $FinalScoreDTOCopyWith<$Res> {
  _$FinalScoreDTOCopyWithImpl(this._self, this._then);

  final FinalScoreDTO _self;
  final $Res Function(FinalScoreDTO) _then;

/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainPlayerScore = null,Object? opponentScore = null,}) {
  return _then(_self.copyWith(
mainPlayerScore: null == mainPlayerScore ? _self.mainPlayerScore : mainPlayerScore // ignore: cast_nullable_to_non_nullable
as GamerScoreDTO,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as GamerScoreDTO,
  ));
}
/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreDTOCopyWith<$Res> get mainPlayerScore {
  
  return $GamerScoreDTOCopyWith<$Res>(_self.mainPlayerScore, (value) {
    return _then(_self.copyWith(mainPlayerScore: value));
  });
}/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreDTOCopyWith<$Res> get opponentScore {
  
  return $GamerScoreDTOCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [FinalScoreDTO].
extension FinalScoreDTOPatterns on FinalScoreDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinalScoreDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinalScoreDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinalScoreDTO value)  $default,){
final _that = this;
switch (_that) {
case _FinalScoreDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinalScoreDTO value)?  $default,){
final _that = this;
switch (_that) {
case _FinalScoreDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'playerScore')  GamerScoreDTO mainPlayerScore, @JsonKey(name: 'opponentScore')  GamerScoreDTO opponentScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinalScoreDTO() when $default != null:
return $default(_that.mainPlayerScore,_that.opponentScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'playerScore')  GamerScoreDTO mainPlayerScore, @JsonKey(name: 'opponentScore')  GamerScoreDTO opponentScore)  $default,) {final _that = this;
switch (_that) {
case _FinalScoreDTO():
return $default(_that.mainPlayerScore,_that.opponentScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'playerScore')  GamerScoreDTO mainPlayerScore, @JsonKey(name: 'opponentScore')  GamerScoreDTO opponentScore)?  $default,) {final _that = this;
switch (_that) {
case _FinalScoreDTO() when $default != null:
return $default(_that.mainPlayerScore,_that.opponentScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinalScoreDTO extends FinalScoreDTO {
  const _FinalScoreDTO({@JsonKey(name: 'playerScore') required this.mainPlayerScore, @JsonKey(name: 'opponentScore') required this.opponentScore}): super._();
  factory _FinalScoreDTO.fromJson(Map<String, dynamic> json) => _$FinalScoreDTOFromJson(json);

@override@JsonKey(name: 'playerScore') final  GamerScoreDTO mainPlayerScore;
@override@JsonKey(name: 'opponentScore') final  GamerScoreDTO opponentScore;

/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinalScoreDTOCopyWith<_FinalScoreDTO> get copyWith => __$FinalScoreDTOCopyWithImpl<_FinalScoreDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinalScoreDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinalScoreDTO&&(identical(other.mainPlayerScore, mainPlayerScore) || other.mainPlayerScore == mainPlayerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mainPlayerScore,opponentScore);

@override
String toString() {
  return 'FinalScoreDTO(mainPlayerScore: $mainPlayerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class _$FinalScoreDTOCopyWith<$Res> implements $FinalScoreDTOCopyWith<$Res> {
  factory _$FinalScoreDTOCopyWith(_FinalScoreDTO value, $Res Function(_FinalScoreDTO) _then) = __$FinalScoreDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'playerScore') GamerScoreDTO mainPlayerScore,@JsonKey(name: 'opponentScore') GamerScoreDTO opponentScore
});


@override $GamerScoreDTOCopyWith<$Res> get mainPlayerScore;@override $GamerScoreDTOCopyWith<$Res> get opponentScore;

}
/// @nodoc
class __$FinalScoreDTOCopyWithImpl<$Res>
    implements _$FinalScoreDTOCopyWith<$Res> {
  __$FinalScoreDTOCopyWithImpl(this._self, this._then);

  final _FinalScoreDTO _self;
  final $Res Function(_FinalScoreDTO) _then;

/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainPlayerScore = null,Object? opponentScore = null,}) {
  return _then(_FinalScoreDTO(
mainPlayerScore: null == mainPlayerScore ? _self.mainPlayerScore : mainPlayerScore // ignore: cast_nullable_to_non_nullable
as GamerScoreDTO,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as GamerScoreDTO,
  ));
}

/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreDTOCopyWith<$Res> get mainPlayerScore {
  
  return $GamerScoreDTOCopyWith<$Res>(_self.mainPlayerScore, (value) {
    return _then(_self.copyWith(mainPlayerScore: value));
  });
}/// Create a copy of FinalScoreDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreDTOCopyWith<$Res> get opponentScore {
  
  return $GamerScoreDTOCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}

// dart format on
