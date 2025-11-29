// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contestant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Contestant {

 String get name; TicTacToeSymbols get symbol;
/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContestantCopyWith<Contestant> get copyWith => _$ContestantCopyWithImpl<Contestant>(this as Contestant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contestant&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,name,symbol);

@override
String toString() {
  return 'Contestant(name: $name, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $ContestantCopyWith<$Res>  {
  factory $ContestantCopyWith(Contestant value, $Res Function(Contestant) _then) = _$ContestantCopyWithImpl;
@useResult
$Res call({
 String name, TicTacToeSymbols symbol
});




}
/// @nodoc
class _$ContestantCopyWithImpl<$Res>
    implements $ContestantCopyWith<$Res> {
  _$ContestantCopyWithImpl(this._self, this._then);

  final Contestant _self;
  final $Res Function(Contestant) _then;

/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? symbol = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as TicTacToeSymbols,
  ));
}

}


/// Adds pattern-matching-related methods to [Contestant].
extension ContestantPatterns on Contestant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MainContestant value)?  mainContestant,TResult Function( Opponent value)?  opponent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MainContestant() when mainContestant != null:
return mainContestant(_that);case Opponent() when opponent != null:
return opponent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MainContestant value)  mainContestant,required TResult Function( Opponent value)  opponent,}){
final _that = this;
switch (_that) {
case MainContestant():
return mainContestant(_that);case Opponent():
return opponent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MainContestant value)?  mainContestant,TResult? Function( Opponent value)?  opponent,}){
final _that = this;
switch (_that) {
case MainContestant() when mainContestant != null:
return mainContestant(_that);case Opponent() when opponent != null:
return opponent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name,  TicTacToeSymbols symbol)?  mainContestant,TResult Function( String name,  TicTacToeSymbols symbol)?  opponent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MainContestant() when mainContestant != null:
return mainContestant(_that.name,_that.symbol);case Opponent() when opponent != null:
return opponent(_that.name,_that.symbol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name,  TicTacToeSymbols symbol)  mainContestant,required TResult Function( String name,  TicTacToeSymbols symbol)  opponent,}) {final _that = this;
switch (_that) {
case MainContestant():
return mainContestant(_that.name,_that.symbol);case Opponent():
return opponent(_that.name,_that.symbol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name,  TicTacToeSymbols symbol)?  mainContestant,TResult? Function( String name,  TicTacToeSymbols symbol)?  opponent,}) {final _that = this;
switch (_that) {
case MainContestant() when mainContestant != null:
return mainContestant(_that.name,_that.symbol);case Opponent() when opponent != null:
return opponent(_that.name,_that.symbol);case _:
  return null;

}
}

}

/// @nodoc


class MainContestant extends Contestant {
  const MainContestant({required this.name, required this.symbol}): super._();
  

@override final  String name;
@override final  TicTacToeSymbols symbol;

/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainContestantCopyWith<MainContestant> get copyWith => _$MainContestantCopyWithImpl<MainContestant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainContestant&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,name,symbol);

@override
String toString() {
  return 'Contestant.mainContestant(name: $name, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $MainContestantCopyWith<$Res> implements $ContestantCopyWith<$Res> {
  factory $MainContestantCopyWith(MainContestant value, $Res Function(MainContestant) _then) = _$MainContestantCopyWithImpl;
@override @useResult
$Res call({
 String name, TicTacToeSymbols symbol
});




}
/// @nodoc
class _$MainContestantCopyWithImpl<$Res>
    implements $MainContestantCopyWith<$Res> {
  _$MainContestantCopyWithImpl(this._self, this._then);

  final MainContestant _self;
  final $Res Function(MainContestant) _then;

/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? symbol = null,}) {
  return _then(MainContestant(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as TicTacToeSymbols,
  ));
}


}

/// @nodoc


class Opponent extends Contestant {
  const Opponent({required this.name, required this.symbol}): super._();
  

@override final  String name;
@override final  TicTacToeSymbols symbol;

/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpponentCopyWith<Opponent> get copyWith => _$OpponentCopyWithImpl<Opponent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Opponent&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol));
}


@override
int get hashCode => Object.hash(runtimeType,name,symbol);

@override
String toString() {
  return 'Contestant.opponent(name: $name, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $OpponentCopyWith<$Res> implements $ContestantCopyWith<$Res> {
  factory $OpponentCopyWith(Opponent value, $Res Function(Opponent) _then) = _$OpponentCopyWithImpl;
@override @useResult
$Res call({
 String name, TicTacToeSymbols symbol
});




}
/// @nodoc
class _$OpponentCopyWithImpl<$Res>
    implements $OpponentCopyWith<$Res> {
  _$OpponentCopyWithImpl(this._self, this._then);

  final Opponent _self;
  final $Res Function(Opponent) _then;

/// Create a copy of Contestant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? symbol = null,}) {
  return _then(Opponent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as TicTacToeSymbols,
  ));
}


}

// dart format on
