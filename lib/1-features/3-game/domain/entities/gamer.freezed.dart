// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Gamer {

 String get name; int get remainingCounts; int get wins; XorO get symbol;
/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamerCopyWith<Gamer> get copyWith => _$GamerCopyWithImpl<Gamer>(this as Gamer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gamer&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingCounts, remainingCounts) || other.remainingCounts == remainingCounts)&&(identical(other.wins, wins) || other.wins == wins)&&const DeepCollectionEquality().equals(other.symbol, symbol));
}


@override
int get hashCode => Object.hash(runtimeType,name,remainingCounts,wins,const DeepCollectionEquality().hash(symbol));

@override
String toString() {
  return 'Gamer(name: $name, remainingCounts: $remainingCounts, wins: $wins, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class $GamerCopyWith<$Res>  {
  factory $GamerCopyWith(Gamer value, $Res Function(Gamer) _then) = _$GamerCopyWithImpl;
@useResult
$Res call({
 String name, int remainingCounts, int wins, XorO symbol
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? remainingCounts = null,Object? wins = null,Object? symbol = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingCounts: null == remainingCounts ? _self.remainingCounts : remainingCounts // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as XorO,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int remainingCounts,  int wins,  XorO symbol)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gamer() when $default != null:
return $default(_that.name,_that.remainingCounts,_that.wins,_that.symbol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int remainingCounts,  int wins,  XorO symbol)  $default,) {final _that = this;
switch (_that) {
case _Gamer():
return $default(_that.name,_that.remainingCounts,_that.wins,_that.symbol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int remainingCounts,  int wins,  XorO symbol)?  $default,) {final _that = this;
switch (_that) {
case _Gamer() when $default != null:
return $default(_that.name,_that.remainingCounts,_that.wins,_that.symbol);case _:
  return null;

}
}

}

/// @nodoc


class _Gamer extends Gamer {
  const _Gamer({required this.name, required this.remainingCounts, required this.wins, required this.symbol}): super._();
  

@override final  String name;
@override final  int remainingCounts;
@override final  int wins;
@override final  XorO symbol;

/// Create a copy of Gamer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamerCopyWith<_Gamer> get copyWith => __$GamerCopyWithImpl<_Gamer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gamer&&(identical(other.name, name) || other.name == name)&&(identical(other.remainingCounts, remainingCounts) || other.remainingCounts == remainingCounts)&&(identical(other.wins, wins) || other.wins == wins)&&const DeepCollectionEquality().equals(other.symbol, symbol));
}


@override
int get hashCode => Object.hash(runtimeType,name,remainingCounts,wins,const DeepCollectionEquality().hash(symbol));

@override
String toString() {
  return 'Gamer(name: $name, remainingCounts: $remainingCounts, wins: $wins, symbol: $symbol)';
}


}

/// @nodoc
abstract mixin class _$GamerCopyWith<$Res> implements $GamerCopyWith<$Res> {
  factory _$GamerCopyWith(_Gamer value, $Res Function(_Gamer) _then) = __$GamerCopyWithImpl;
@override @useResult
$Res call({
 String name, int remainingCounts, int wins, XorO symbol
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? remainingCounts = null,Object? wins = null,Object? symbol = freezed,}) {
  return _then(_Gamer(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,remainingCounts: null == remainingCounts ? _self.remainingCounts : remainingCounts // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,symbol: freezed == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as XorO,
  ));
}


}

// dart format on
