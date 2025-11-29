// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FinalScore {

 GamerScore get mainPlayerScore; GamerScore get opponentScore;
/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinalScoreCopyWith<FinalScore> get copyWith => _$FinalScoreCopyWithImpl<FinalScore>(this as FinalScore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinalScore&&(identical(other.mainPlayerScore, mainPlayerScore) || other.mainPlayerScore == mainPlayerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}


@override
int get hashCode => Object.hash(runtimeType,mainPlayerScore,opponentScore);

@override
String toString() {
  return 'FinalScore(mainPlayerScore: $mainPlayerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class $FinalScoreCopyWith<$Res>  {
  factory $FinalScoreCopyWith(FinalScore value, $Res Function(FinalScore) _then) = _$FinalScoreCopyWithImpl;
@useResult
$Res call({
 GamerScore mainPlayerScore, GamerScore opponentScore
});


$GamerScoreCopyWith<$Res> get mainPlayerScore;$GamerScoreCopyWith<$Res> get opponentScore;

}
/// @nodoc
class _$FinalScoreCopyWithImpl<$Res>
    implements $FinalScoreCopyWith<$Res> {
  _$FinalScoreCopyWithImpl(this._self, this._then);

  final FinalScore _self;
  final $Res Function(FinalScore) _then;

/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mainPlayerScore = null,Object? opponentScore = null,}) {
  return _then(_self.copyWith(
mainPlayerScore: null == mainPlayerScore ? _self.mainPlayerScore : mainPlayerScore // ignore: cast_nullable_to_non_nullable
as GamerScore,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as GamerScore,
  ));
}
/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreCopyWith<$Res> get mainPlayerScore {
  
  return $GamerScoreCopyWith<$Res>(_self.mainPlayerScore, (value) {
    return _then(_self.copyWith(mainPlayerScore: value));
  });
}/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreCopyWith<$Res> get opponentScore {
  
  return $GamerScoreCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [FinalScore].
extension FinalScorePatterns on FinalScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinalScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinalScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinalScore value)  $default,){
final _that = this;
switch (_that) {
case _FinalScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinalScore value)?  $default,){
final _that = this;
switch (_that) {
case _FinalScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GamerScore mainPlayerScore,  GamerScore opponentScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinalScore() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GamerScore mainPlayerScore,  GamerScore opponentScore)  $default,) {final _that = this;
switch (_that) {
case _FinalScore():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GamerScore mainPlayerScore,  GamerScore opponentScore)?  $default,) {final _that = this;
switch (_that) {
case _FinalScore() when $default != null:
return $default(_that.mainPlayerScore,_that.opponentScore);case _:
  return null;

}
}

}

/// @nodoc


class _FinalScore extends FinalScore {
  const _FinalScore({required this.mainPlayerScore, required this.opponentScore}): super._();
  

@override final  GamerScore mainPlayerScore;
@override final  GamerScore opponentScore;

/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinalScoreCopyWith<_FinalScore> get copyWith => __$FinalScoreCopyWithImpl<_FinalScore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinalScore&&(identical(other.mainPlayerScore, mainPlayerScore) || other.mainPlayerScore == mainPlayerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}


@override
int get hashCode => Object.hash(runtimeType,mainPlayerScore,opponentScore);

@override
String toString() {
  return 'FinalScore(mainPlayerScore: $mainPlayerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class _$FinalScoreCopyWith<$Res> implements $FinalScoreCopyWith<$Res> {
  factory _$FinalScoreCopyWith(_FinalScore value, $Res Function(_FinalScore) _then) = __$FinalScoreCopyWithImpl;
@override @useResult
$Res call({
 GamerScore mainPlayerScore, GamerScore opponentScore
});


@override $GamerScoreCopyWith<$Res> get mainPlayerScore;@override $GamerScoreCopyWith<$Res> get opponentScore;

}
/// @nodoc
class __$FinalScoreCopyWithImpl<$Res>
    implements _$FinalScoreCopyWith<$Res> {
  __$FinalScoreCopyWithImpl(this._self, this._then);

  final _FinalScore _self;
  final $Res Function(_FinalScore) _then;

/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mainPlayerScore = null,Object? opponentScore = null,}) {
  return _then(_FinalScore(
mainPlayerScore: null == mainPlayerScore ? _self.mainPlayerScore : mainPlayerScore // ignore: cast_nullable_to_non_nullable
as GamerScore,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as GamerScore,
  ));
}

/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreCopyWith<$Res> get mainPlayerScore {
  
  return $GamerScoreCopyWith<$Res>(_self.mainPlayerScore, (value) {
    return _then(_self.copyWith(mainPlayerScore: value));
  });
}/// Create a copy of FinalScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerScoreCopyWith<$Res> get opponentScore {
  
  return $GamerScoreCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}

// dart format on
