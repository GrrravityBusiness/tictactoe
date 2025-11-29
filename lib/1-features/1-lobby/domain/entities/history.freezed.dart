// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$History {

 Score get playerScore; Score get opponentScore;
/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryCopyWith<History> get copyWith => _$HistoryCopyWithImpl<History>(this as History, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is History&&(identical(other.playerScore, playerScore) || other.playerScore == playerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}


@override
int get hashCode => Object.hash(runtimeType,playerScore,opponentScore);

@override
String toString() {
  return 'History(playerScore: $playerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class $HistoryCopyWith<$Res>  {
  factory $HistoryCopyWith(History value, $Res Function(History) _then) = _$HistoryCopyWithImpl;
@useResult
$Res call({
 Score playerScore, Score opponentScore
});


$ScoreCopyWith<$Res> get playerScore;$ScoreCopyWith<$Res> get opponentScore;

}
/// @nodoc
class _$HistoryCopyWithImpl<$Res>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._self, this._then);

  final History _self;
  final $Res Function(History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerScore = null,Object? opponentScore = null,}) {
  return _then(_self.copyWith(
playerScore: null == playerScore ? _self.playerScore : playerScore // ignore: cast_nullable_to_non_nullable
as Score,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as Score,
  ));
}
/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreCopyWith<$Res> get playerScore {
  
  return $ScoreCopyWith<$Res>(_self.playerScore, (value) {
    return _then(_self.copyWith(playerScore: value));
  });
}/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreCopyWith<$Res> get opponentScore {
  
  return $ScoreCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [History].
extension HistoryPatterns on History {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _History value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _History() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _History value)  $default,){
final _that = this;
switch (_that) {
case _History():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _History value)?  $default,){
final _that = this;
switch (_that) {
case _History() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Score playerScore,  Score opponentScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _History() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Score playerScore,  Score opponentScore)  $default,) {final _that = this;
switch (_that) {
case _History():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Score playerScore,  Score opponentScore)?  $default,) {final _that = this;
switch (_that) {
case _History() when $default != null:
return $default(_that.playerScore,_that.opponentScore);case _:
  return null;

}
}

}

/// @nodoc


class _History extends History {
  const _History({required this.playerScore, required this.opponentScore}): super._();
  

@override final  Score playerScore;
@override final  Score opponentScore;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryCopyWith<_History> get copyWith => __$HistoryCopyWithImpl<_History>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _History&&(identical(other.playerScore, playerScore) || other.playerScore == playerScore)&&(identical(other.opponentScore, opponentScore) || other.opponentScore == opponentScore));
}


@override
int get hashCode => Object.hash(runtimeType,playerScore,opponentScore);

@override
String toString() {
  return 'History(playerScore: $playerScore, opponentScore: $opponentScore)';
}


}

/// @nodoc
abstract mixin class _$HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$HistoryCopyWith(_History value, $Res Function(_History) _then) = __$HistoryCopyWithImpl;
@override @useResult
$Res call({
 Score playerScore, Score opponentScore
});


@override $ScoreCopyWith<$Res> get playerScore;@override $ScoreCopyWith<$Res> get opponentScore;

}
/// @nodoc
class __$HistoryCopyWithImpl<$Res>
    implements _$HistoryCopyWith<$Res> {
  __$HistoryCopyWithImpl(this._self, this._then);

  final _History _self;
  final $Res Function(_History) _then;

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerScore = null,Object? opponentScore = null,}) {
  return _then(_History(
playerScore: null == playerScore ? _self.playerScore : playerScore // ignore: cast_nullable_to_non_nullable
as Score,opponentScore: null == opponentScore ? _self.opponentScore : opponentScore // ignore: cast_nullable_to_non_nullable
as Score,
  ));
}

/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreCopyWith<$Res> get playerScore {
  
  return $ScoreCopyWith<$Res>(_self.playerScore, (value) {
    return _then(_self.copyWith(playerScore: value));
  });
}/// Create a copy of History
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreCopyWith<$Res> get opponentScore {
  
  return $ScoreCopyWith<$Res>(_self.opponentScore, (value) {
    return _then(_self.copyWith(opponentScore: value));
  });
}
}

// dart format on
