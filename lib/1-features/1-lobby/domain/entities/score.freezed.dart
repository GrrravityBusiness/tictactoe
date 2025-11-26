// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Score {

 Contestant get contestant; int get points;
/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreCopyWith<Score> get copyWith => _$ScoreCopyWithImpl<Score>(this as Score, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Score&&(identical(other.contestant, contestant) || other.contestant == contestant)&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,contestant,points);

@override
String toString() {
  return 'Score(contestant: $contestant, points: $points)';
}


}

/// @nodoc
abstract mixin class $ScoreCopyWith<$Res>  {
  factory $ScoreCopyWith(Score value, $Res Function(Score) _then) = _$ScoreCopyWithImpl;
@useResult
$Res call({
 Contestant contestant, int points
});


$ContestantCopyWith<$Res> get contestant;

}
/// @nodoc
class _$ScoreCopyWithImpl<$Res>
    implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._self, this._then);

  final Score _self;
  final $Res Function(Score) _then;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contestant = null,Object? points = null,}) {
  return _then(_self.copyWith(
contestant: null == contestant ? _self.contestant : contestant // ignore: cast_nullable_to_non_nullable
as Contestant,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContestantCopyWith<$Res> get contestant {
  
  return $ContestantCopyWith<$Res>(_self.contestant, (value) {
    return _then(_self.copyWith(contestant: value));
  });
}
}


/// Adds pattern-matching-related methods to [Score].
extension ScorePatterns on Score {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Score value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Score() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Score value)  $default,){
final _that = this;
switch (_that) {
case _Score():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Score value)?  $default,){
final _that = this;
switch (_that) {
case _Score() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Contestant contestant,  int points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Score() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Contestant contestant,  int points)  $default,) {final _that = this;
switch (_that) {
case _Score():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Contestant contestant,  int points)?  $default,) {final _that = this;
switch (_that) {
case _Score() when $default != null:
return $default(_that.contestant,_that.points);case _:
  return null;

}
}

}

/// @nodoc


class _Score extends Score {
  const _Score({required this.contestant, required this.points}): super._();
  

@override final  Contestant contestant;
@override final  int points;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreCopyWith<_Score> get copyWith => __$ScoreCopyWithImpl<_Score>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Score&&(identical(other.contestant, contestant) || other.contestant == contestant)&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,contestant,points);

@override
String toString() {
  return 'Score(contestant: $contestant, points: $points)';
}


}

/// @nodoc
abstract mixin class _$ScoreCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$ScoreCopyWith(_Score value, $Res Function(_Score) _then) = __$ScoreCopyWithImpl;
@override @useResult
$Res call({
 Contestant contestant, int points
});


@override $ContestantCopyWith<$Res> get contestant;

}
/// @nodoc
class __$ScoreCopyWithImpl<$Res>
    implements _$ScoreCopyWith<$Res> {
  __$ScoreCopyWithImpl(this._self, this._then);

  final _Score _self;
  final $Res Function(_Score) _then;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contestant = null,Object? points = null,}) {
  return _then(_Score(
contestant: null == contestant ? _self.contestant : contestant // ignore: cast_nullable_to_non_nullable
as Contestant,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContestantCopyWith<$Res> get contestant {
  
  return $ContestantCopyWith<$Res>(_self.contestant, (value) {
    return _then(_self.copyWith(contestant: value));
  });
}
}

// dart format on
