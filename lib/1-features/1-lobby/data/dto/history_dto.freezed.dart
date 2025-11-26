// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryDTO {

 ScoreDTO get playerScore; ScoreDTO get opponentScore;
/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDTOCopyWith<HistoryDTO> get copyWith => _$HistoryDTOCopyWithImpl<HistoryDTO>(this as HistoryDTO, _$identity);

  /// Serializes this HistoryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDTO&&(identical(other.playerScore, playerScore) || other.playerScore == playerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerScore,opponentScore);

@override
String toString() {
  return 'HistoryDTO(playerScore: $playerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class $HistoryDTOCopyWith<$Res>  {
  factory $HistoryDTOCopyWith(HistoryDTO value, $Res Function(HistoryDTO) _then) = _$HistoryDTOCopyWithImpl;
@useResult
$Res call({
 ScoreDTO playerScore, ScoreDTO opponentScore
});


$ScoreDTOCopyWith<$Res> get playerScore;$ScoreDTOCopyWith<$Res> get opponentScore;

}
/// @nodoc
class _$HistoryDTOCopyWithImpl<$Res>
    implements $HistoryDTOCopyWith<$Res> {
  _$HistoryDTOCopyWithImpl(this._self, this._then);

  final HistoryDTO _self;
  final $Res Function(HistoryDTO) _then;

/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerScore = null,Object? opponentScore = null,}) {
  return _then(_self.copyWith(
playerScore: null == playerScore ? _self.playerScore : playerScore // ignore: cast_nullable_to_non_nullable
as ScoreDTO,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as ScoreDTO,
  ));
}
/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreDTOCopyWith<$Res> get playerScore {
  
  return $ScoreDTOCopyWith<$Res>(_self.playerScore, (value) {
    return _then(_self.copyWith(playerScore: value));
  });
}/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreDTOCopyWith<$Res> get opponentScore {
  
  return $ScoreDTOCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryDTO].
extension HistoryDTOPatterns on HistoryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryDTO value)  $default,){
final _that = this;
switch (_that) {
case _HistoryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScoreDTO playerScore,  ScoreDTO opponentScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryDTO() when $default != null:
return $default(_that.playerScore,_that.opponentScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScoreDTO playerScore,  ScoreDTO opponentScore)  $default,) {final _that = this;
switch (_that) {
case _HistoryDTO():
return $default(_that.playerScore,_that.opponentScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScoreDTO playerScore,  ScoreDTO opponentScore)?  $default,) {final _that = this;
switch (_that) {
case _HistoryDTO() when $default != null:
return $default(_that.playerScore,_that.opponentScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryDTO extends HistoryDTO {
  const _HistoryDTO({required this.playerScore, required this.opponentScore}): super._();
  factory _HistoryDTO.fromJson(Map<String, dynamic> json) => _$HistoryDTOFromJson(json);

@override final  ScoreDTO playerScore;
@override final  ScoreDTO opponentScore;

/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDTOCopyWith<_HistoryDTO> get copyWith => __$HistoryDTOCopyWithImpl<_HistoryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryDTO&&(identical(other.playerScore, playerScore) || other.playerScore == playerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerScore,opponentScore);

@override
String toString() {
  return 'HistoryDTO(playerScore: $playerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class _$HistoryDTOCopyWith<$Res> implements $HistoryDTOCopyWith<$Res> {
  factory _$HistoryDTOCopyWith(_HistoryDTO value, $Res Function(_HistoryDTO) _then) = __$HistoryDTOCopyWithImpl;
@override @useResult
$Res call({
 ScoreDTO playerScore, ScoreDTO opponentScore
});


@override $ScoreDTOCopyWith<$Res> get playerScore;@override $ScoreDTOCopyWith<$Res> get opponentScore;

}
/// @nodoc
class __$HistoryDTOCopyWithImpl<$Res>
    implements _$HistoryDTOCopyWith<$Res> {
  __$HistoryDTOCopyWithImpl(this._self, this._then);

  final _HistoryDTO _self;
  final $Res Function(_HistoryDTO) _then;

/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerScore = null,Object? opponentScore = null,}) {
  return _then(_HistoryDTO(
playerScore: null == playerScore ? _self.playerScore : playerScore // ignore: cast_nullable_to_non_nullable
as ScoreDTO,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as ScoreDTO,
  ));
}

/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreDTOCopyWith<$Res> get playerScore {
  
  return $ScoreDTOCopyWith<$Res>(_self.playerScore, (value) {
    return _then(_self.copyWith(playerScore: value));
  });
}/// Create a copy of HistoryDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreDTOCopyWith<$Res> get opponentScore {
  
  return $ScoreDTOCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}

// dart format on
