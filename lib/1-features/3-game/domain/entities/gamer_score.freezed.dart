// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamer_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GamerScore {

 int get points; GamerCmd get gamer;
/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamerScoreCopyWith<GamerScore> get copyWith => _$GamerScoreCopyWithImpl<GamerScore>(this as GamerScore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamerScore&&(identical(other.points, points) || other.points == points)&&(identical(other.gamer, gamer) || other.gamer == gamer));
}


@override
int get hashCode => Object.hash(runtimeType,points,gamer);

@override
String toString() {
  return 'GamerScore(points: $points, gamer: $gamer)';
}


}

/// @nodoc
abstract mixin class $GamerScoreCopyWith<$Res>  {
  factory $GamerScoreCopyWith(GamerScore value, $Res Function(GamerScore) _then) = _$GamerScoreCopyWithImpl;
@useResult
$Res call({
 int points, GamerCmd gamer
});


$GamerCmdCopyWith<$Res> get gamer;

}
/// @nodoc
class _$GamerScoreCopyWithImpl<$Res>
    implements $GamerScoreCopyWith<$Res> {
  _$GamerScoreCopyWithImpl(this._self, this._then);

  final GamerScore _self;
  final $Res Function(GamerScore) _then;

/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? gamer = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,gamer: null == gamer ? _self.gamer : gamer // ignore: cast_nullable_to_non_nullable
as GamerCmd,
  ));
}
/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCmdCopyWith<$Res> get gamer {
  
  return $GamerCmdCopyWith<$Res>(_self.gamer, (value) {
    return _then(_self.copyWith(gamer: value));
  });
}
}


/// Adds pattern-matching-related methods to [GamerScore].
extension GamerScorePatterns on GamerScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamerScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamerScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamerScore value)  $default,){
final _that = this;
switch (_that) {
case _GamerScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamerScore value)?  $default,){
final _that = this;
switch (_that) {
case _GamerScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  GamerCmd gamer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamerScore() when $default != null:
return $default(_that.points,_that.gamer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  GamerCmd gamer)  $default,) {final _that = this;
switch (_that) {
case _GamerScore():
return $default(_that.points,_that.gamer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  GamerCmd gamer)?  $default,) {final _that = this;
switch (_that) {
case _GamerScore() when $default != null:
return $default(_that.points,_that.gamer);case _:
  return null;

}
}

}

/// @nodoc


class _GamerScore extends GamerScore {
  const _GamerScore({required this.points, required this.gamer}): super._();
  

@override final  int points;
@override final  GamerCmd gamer;

/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamerScoreCopyWith<_GamerScore> get copyWith => __$GamerScoreCopyWithImpl<_GamerScore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamerScore&&(identical(other.points, points) || other.points == points)&&(identical(other.gamer, gamer) || other.gamer == gamer));
}


@override
int get hashCode => Object.hash(runtimeType,points,gamer);

@override
String toString() {
  return 'GamerScore(points: $points, gamer: $gamer)';
}


}

/// @nodoc
abstract mixin class _$GamerScoreCopyWith<$Res> implements $GamerScoreCopyWith<$Res> {
  factory _$GamerScoreCopyWith(_GamerScore value, $Res Function(_GamerScore) _then) = __$GamerScoreCopyWithImpl;
@override @useResult
$Res call({
 int points, GamerCmd gamer
});


@override $GamerCmdCopyWith<$Res> get gamer;

}
/// @nodoc
class __$GamerScoreCopyWithImpl<$Res>
    implements _$GamerScoreCopyWith<$Res> {
  __$GamerScoreCopyWithImpl(this._self, this._then);

  final _GamerScore _self;
  final $Res Function(_GamerScore) _then;

/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? gamer = null,}) {
  return _then(_GamerScore(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,gamer: null == gamer ? _self.gamer : gamer // ignore: cast_nullable_to_non_nullable
as GamerCmd,
  ));
}

/// Create a copy of GamerScore
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCmdCopyWith<$Res> get gamer {
  
  return $GamerCmdCopyWith<$Res>(_self.gamer, (value) {
    return _then(_self.copyWith(gamer: value));
  });
}
}

// dart format on
