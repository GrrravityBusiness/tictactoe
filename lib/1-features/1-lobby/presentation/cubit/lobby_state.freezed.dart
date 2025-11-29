// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LobbyData {

 MainContestant get player; Opponent? get opponent; List<History> get history;
/// Create a copy of LobbyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyDataCopyWith<LobbyData> get copyWith => _$LobbyDataCopyWithImpl<LobbyData>(this as LobbyData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyData&&const DeepCollectionEquality().equals(other.player, player)&&const DeepCollectionEquality().equals(other.opponent, opponent)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(player),const DeepCollectionEquality().hash(opponent),const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'LobbyData(player: $player, opponent: $opponent, history: $history)';
}


}

/// @nodoc
abstract mixin class $LobbyDataCopyWith<$Res>  {
  factory $LobbyDataCopyWith(LobbyData value, $Res Function(LobbyData) _then) = _$LobbyDataCopyWithImpl;
@useResult
$Res call({
 MainContestant player, Opponent? opponent, List<History> history
});




}
/// @nodoc
class _$LobbyDataCopyWithImpl<$Res>
    implements $LobbyDataCopyWith<$Res> {
  _$LobbyDataCopyWithImpl(this._self, this._then);

  final LobbyData _self;
  final $Res Function(LobbyData) _then;

/// Create a copy of LobbyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player = freezed,Object? opponent = freezed,Object? history = null,}) {
  return _then(_self.copyWith(
player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as MainContestant,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as Opponent?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<History>,
  ));
}

}


/// Adds pattern-matching-related methods to [LobbyData].
extension LobbyDataPatterns on LobbyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LobbyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LobbyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LobbyData value)  $default,){
final _that = this;
switch (_that) {
case _LobbyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LobbyData value)?  $default,){
final _that = this;
switch (_that) {
case _LobbyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MainContestant player,  Opponent? opponent,  List<History> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LobbyData() when $default != null:
return $default(_that.player,_that.opponent,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MainContestant player,  Opponent? opponent,  List<History> history)  $default,) {final _that = this;
switch (_that) {
case _LobbyData():
return $default(_that.player,_that.opponent,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MainContestant player,  Opponent? opponent,  List<History> history)?  $default,) {final _that = this;
switch (_that) {
case _LobbyData() when $default != null:
return $default(_that.player,_that.opponent,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _LobbyData extends LobbyData {
  const _LobbyData({required this.player, this.opponent, final  List<History> history = const <History>[]}): _history = history,super._();
  

@override final  MainContestant player;
@override final  Opponent? opponent;
 final  List<History> _history;
@override@JsonKey() List<History> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of LobbyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LobbyDataCopyWith<_LobbyData> get copyWith => __$LobbyDataCopyWithImpl<_LobbyData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LobbyData&&const DeepCollectionEquality().equals(other.player, player)&&const DeepCollectionEquality().equals(other.opponent, opponent)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(player),const DeepCollectionEquality().hash(opponent),const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'LobbyData(player: $player, opponent: $opponent, history: $history)';
}


}

/// @nodoc
abstract mixin class _$LobbyDataCopyWith<$Res> implements $LobbyDataCopyWith<$Res> {
  factory _$LobbyDataCopyWith(_LobbyData value, $Res Function(_LobbyData) _then) = __$LobbyDataCopyWithImpl;
@override @useResult
$Res call({
 MainContestant player, Opponent? opponent, List<History> history
});




}
/// @nodoc
class __$LobbyDataCopyWithImpl<$Res>
    implements _$LobbyDataCopyWith<$Res> {
  __$LobbyDataCopyWithImpl(this._self, this._then);

  final _LobbyData _self;
  final $Res Function(_LobbyData) _then;

/// Create a copy of LobbyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player = freezed,Object? opponent = freezed,Object? history = null,}) {
  return _then(_LobbyData(
player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as MainContestant,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as Opponent?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<History>,
  ));
}


}

// dart format on
