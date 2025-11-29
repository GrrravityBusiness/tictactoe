// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResult {

 int? get winnningPlayer;
/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultCopyWith<GameResult> get copyWith => _$GameResultCopyWithImpl<GameResult>(this as GameResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult&&(identical(other.winnningPlayer, winnningPlayer) || other.winnningPlayer == winnningPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,winnningPlayer);

@override
String toString() {
  return 'GameResult(winnningPlayer: $winnningPlayer)';
}


}

/// @nodoc
abstract mixin class $GameResultCopyWith<$Res>  {
  factory $GameResultCopyWith(GameResult value, $Res Function(GameResult) _then) = _$GameResultCopyWithImpl;
@useResult
$Res call({
 int? winnningPlayer
});




}
/// @nodoc
class _$GameResultCopyWithImpl<$Res>
    implements $GameResultCopyWith<$Res> {
  _$GameResultCopyWithImpl(this._self, this._then);

  final GameResult _self;
  final $Res Function(GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? winnningPlayer = freezed,}) {
  return _then(_self.copyWith(
winnningPlayer: freezed == winnningPlayer ? _self.winnningPlayer : winnningPlayer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResult value)  $default,){
final _that = this;
switch (_that) {
case _GameResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResult value)?  $default,){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? winnningPlayer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.winnningPlayer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? winnningPlayer)  $default,) {final _that = this;
switch (_that) {
case _GameResult():
return $default(_that.winnningPlayer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? winnningPlayer)?  $default,) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.winnningPlayer);case _:
  return null;

}
}

}

/// @nodoc


class _GameResult extends GameResult {
  const _GameResult({this.winnningPlayer}): super._();
  

@override final  int? winnningPlayer;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultCopyWith<_GameResult> get copyWith => __$GameResultCopyWithImpl<_GameResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResult&&(identical(other.winnningPlayer, winnningPlayer) || other.winnningPlayer == winnningPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,winnningPlayer);

@override
String toString() {
  return 'GameResult(winnningPlayer: $winnningPlayer)';
}


}

/// @nodoc
abstract mixin class _$GameResultCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$GameResultCopyWith(_GameResult value, $Res Function(_GameResult) _then) = __$GameResultCopyWithImpl;
@override @useResult
$Res call({
 int? winnningPlayer
});




}
/// @nodoc
class __$GameResultCopyWithImpl<$Res>
    implements _$GameResultCopyWith<$Res> {
  __$GameResultCopyWithImpl(this._self, this._then);

  final _GameResult _self;
  final $Res Function(_GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? winnningPlayer = freezed,}) {
  return _then(_GameResult(
winnningPlayer: freezed == winnningPlayer ? _self.winnningPlayer : winnningPlayer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
