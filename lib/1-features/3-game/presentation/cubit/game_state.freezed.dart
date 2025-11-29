// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 Gamer get player1; Gamer get player2; int get currentPlayer; List<int> get board; GameResult? get result;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.player1, player1) || other.player1 == player1)&&(identical(other.player2, player2) || other.player2 == player2)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,player1,player2,currentPlayer,const DeepCollectionEquality().hash(board),result);

@override
String toString() {
  return 'GameState(player1: $player1, player2: $player2, currentPlayer: $currentPlayer, board: $board, result: $result)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 Gamer player1, Gamer player2, int currentPlayer, List<int> board, GameResult? result
});


$GamerCopyWith<$Res> get player1;$GamerCopyWith<$Res> get player2;$GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player1 = null,Object? player2 = null,Object? currentPlayer = null,Object? board = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
player1: null == player1 ? _self.player1 : player1 // ignore: cast_nullable_to_non_nullable
as Gamer,player2: null == player2 ? _self.player2 : player2 // ignore: cast_nullable_to_non_nullable
as Gamer,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as List<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCopyWith<$Res> get player1 {
  
  return $GamerCopyWith<$Res>(_self.player1, (value) {
    return _then(_self.copyWith(player1: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCopyWith<$Res> get player2 {
  
  return $GamerCopyWith<$Res>(_self.player2, (value) {
    return _then(_self.copyWith(player2: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board,  GameResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board,  GameResult? result)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board,  GameResult? result)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({required this.player1, required this.player2, required this.currentPlayer, required final  List<int> board, this.result}): _board = board,super._();
  

@override final  Gamer player1;
@override final  Gamer player2;
@override final  int currentPlayer;
 final  List<int> _board;
@override List<int> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

@override final  GameResult? result;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.player1, player1) || other.player1 == player1)&&(identical(other.player2, player2) || other.player2 == player2)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,player1,player2,currentPlayer,const DeepCollectionEquality().hash(_board),result);

@override
String toString() {
  return 'GameState(player1: $player1, player2: $player2, currentPlayer: $currentPlayer, board: $board, result: $result)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 Gamer player1, Gamer player2, int currentPlayer, List<int> board, GameResult? result
});


@override $GamerCopyWith<$Res> get player1;@override $GamerCopyWith<$Res> get player2;@override $GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player1 = null,Object? player2 = null,Object? currentPlayer = null,Object? board = null,Object? result = freezed,}) {
  return _then(_GameState(
player1: null == player1 ? _self.player1 : player1 // ignore: cast_nullable_to_non_nullable
as Gamer,player2: null == player2 ? _self.player2 : player2 // ignore: cast_nullable_to_non_nullable
as Gamer,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCopyWith<$Res> get player1 {
  
  return $GamerCopyWith<$Res>(_self.player1, (value) {
    return _then(_self.copyWith(player1: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GamerCopyWith<$Res> get player2 {
  
  return $GamerCopyWith<$Res>(_self.player2, (value) {
    return _then(_self.copyWith(player2: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
