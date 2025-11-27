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

 Gamer get player1; Gamer get player2; int get currentPlayer; List<int> get board;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.player1, player1) || other.player1 == player1)&&(identical(other.player2, player2) || other.player2 == player2)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&const DeepCollectionEquality().equals(other.board, board));
}


@override
int get hashCode => Object.hash(runtimeType,player1,player2,currentPlayer,const DeepCollectionEquality().hash(board));

@override
String toString() {
  return 'GameState(player1: $player1, player2: $player2, currentPlayer: $currentPlayer, board: $board)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 Gamer player1, Gamer player2, int currentPlayer, List<int> board
});


$GamerCopyWith<$Res> get player1;$GamerCopyWith<$Res> get player2;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player1 = null,Object? player2 = null,Object? currentPlayer = null,Object? board = null,}) {
  return _then(_self.copyWith(
player1: null == player1 ? _self.player1 : player1 // ignore: cast_nullable_to_non_nullable
as Gamer,player2: null == player2 ? _self.player2 : player2 // ignore: cast_nullable_to_non_nullable
as Gamer,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as List<int>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gamer player1,  Gamer player2,  int currentPlayer,  List<int> board)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.player1,_that.player2,_that.currentPlayer,_that.board);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({required this.player1, required this.player2, required this.currentPlayer, required final  List<int> board}): _board = board,super._();
  

@override final  Gamer player1;
@override final  Gamer player2;
@override final  int currentPlayer;
 final  List<int> _board;
@override List<int> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}


/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.player1, player1) || other.player1 == player1)&&(identical(other.player2, player2) || other.player2 == player2)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&const DeepCollectionEquality().equals(other._board, _board));
}


@override
int get hashCode => Object.hash(runtimeType,player1,player2,currentPlayer,const DeepCollectionEquality().hash(_board));

@override
String toString() {
  return 'GameState(player1: $player1, player2: $player2, currentPlayer: $currentPlayer, board: $board)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 Gamer player1, Gamer player2, int currentPlayer, List<int> board
});


@override $GamerCopyWith<$Res> get player1;@override $GamerCopyWith<$Res> get player2;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player1 = null,Object? player2 = null,Object? currentPlayer = null,Object? board = null,}) {
  return _then(_GameState(
player1: null == player1 ? _self.player1 : player1 // ignore: cast_nullable_to_non_nullable
as Gamer,player2: null == player2 ? _self.player2 : player2 // ignore: cast_nullable_to_non_nullable
as Gamer,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as int,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<int>,
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
}
}

/// @nodoc
mixin _$Gamer {

 String get name; int get remainingCounts; int get wins;
/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamerCopyWith<Gamer> get copyWith => _$GamerCopyWithImpl<Gamer>(this as Gamer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gamer&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingCounts, remainingCounts) || other.remainingCounts == remainingCounts)&&(identical(other.wins, wins) || other.wins == wins));
}


@override
int get hashCode => Object.hash(runtimeType,name,remainingCounts,wins);

@override
String toString() {
  return 'Gamer(name: $name, remainingCounts: $remainingCounts, wins: $wins)';
}


}

/// @nodoc
abstract mixin class $GamerCopyWith<$Res>  {
  factory $GamerCopyWith(Gamer value, $Res Function(Gamer) _then) = _$GamerCopyWithImpl;
@useResult
$Res call({
 String name, int remainingCounts, int wins
});




}
/// @nodoc
class _$GamerCopyWithImpl<$Res>
    implements $GamerCopyWith<$Res> {
  _$GamerCopyWithImpl(this._self, this._then);

  final Gamer _self;
  final $Res Function(Gamer) _then;

/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? remainingCounts = null,Object? wins = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingCounts: null == remainingCounts ? _self.remainingCounts : remainingCounts // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Gamer].
extension GamerPatterns on Gamer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gamer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gamer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gamer value)  $default,){
final _that = this;
switch (_that) {
case _Gamer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gamer value)?  $default,){
final _that = this;
switch (_that) {
case _Gamer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int remainingCounts,  int wins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gamer() when $default != null:
return $default(_that.name,_that.remainingCounts,_that.wins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int remainingCounts,  int wins)  $default,) {final _that = this;
switch (_that) {
case _Gamer():
return $default(_that.name,_that.remainingCounts,_that.wins);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int remainingCounts,  int wins)?  $default,) {final _that = this;
switch (_that) {
case _Gamer() when $default != null:
return $default(_that.name,_that.remainingCounts,_that.wins);case _:
  return null;

}
}

}

/// @nodoc


class _Gamer extends Gamer {
  const _Gamer({required this.name, required this.remainingCounts, required this.wins}): super._();
  

@override final  String name;
@override final  int remainingCounts;
@override final  int wins;

/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamerCopyWith<_Gamer> get copyWith => __$GamerCopyWithImpl<_Gamer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gamer&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingCounts, remainingCounts) || other.remainingCounts == remainingCounts)&&(identical(other.wins, wins) || other.wins == wins));
}


@override
int get hashCode => Object.hash(runtimeType,name,remainingCounts,wins);

@override
String toString() {
  return 'Gamer(name: $name, remainingCounts: $remainingCounts, wins: $wins)';
}


}

/// @nodoc
abstract mixin class _$GamerCopyWith<$Res> implements $GamerCopyWith<$Res> {
  factory _$GamerCopyWith(_Gamer value, $Res Function(_Gamer) _then) = __$GamerCopyWithImpl;
@override @useResult
$Res call({
 String name, int remainingCounts, int wins
});




}
/// @nodoc
class __$GamerCopyWithImpl<$Res>
    implements _$GamerCopyWith<$Res> {
  __$GamerCopyWithImpl(this._self, this._then);

  final _Gamer _self;
  final $Res Function(_Gamer) _then;

/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? remainingCounts = null,Object? wins = null,}) {
  return _then(_Gamer(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingCounts: null == remainingCounts ? _self.remainingCounts : remainingCounts // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
