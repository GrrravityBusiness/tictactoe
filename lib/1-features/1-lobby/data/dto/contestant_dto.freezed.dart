// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contestant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContestantDTO {

 String get name; TicTacToeSymbolsDTO get symbol; bool get isMainContestant;
/// Create a copy of ContestantDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContestantDTOCopyWith<ContestantDTO> get copyWith => _$ContestantDTOCopyWithImpl<ContestantDTO>(this as ContestantDTO, _$identity);

  /// Serializes this ContestantDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContestantDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isMainContestant, isMainContestant) || other.isMainContestant == isMainContestant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,symbol,isMainContestant);

@override
String toString() {
  return 'ContestantDTO(name: $name, symbol: $symbol, isMainContestant: $isMainContestant)';
}


}

/// @nodoc
abstract mixin class $ContestantDTOCopyWith<$Res>  {
  factory $ContestantDTOCopyWith(ContestantDTO value, $Res Function(ContestantDTO) _then) = _$ContestantDTOCopyWithImpl;
@useResult
$Res call({
 String name, TicTacToeSymbolsDTO symbol, bool isMainContestant
});




}
/// @nodoc
class _$ContestantDTOCopyWithImpl<$Res>
    implements $ContestantDTOCopyWith<$Res> {
  _$ContestantDTOCopyWithImpl(this._self, this._then);

  final ContestantDTO _self;
  final $Res Function(ContestantDTO) _then;

/// Create a copy of ContestantDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? symbol = null,Object? isMainContestant = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as TicTacToeSymbolsDTO,isMainContestant: null == isMainContestant ? _self.isMainContestant : isMainContestant // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContestantDTO].
extension ContestantDTOPatterns on ContestantDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContestantDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContestantDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContestantDTO value)  $default,){
final _that = this;
switch (_that) {
case _ContestantDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContestantDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ContestantDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  TicTacToeSymbolsDTO symbol,  bool isMainContestant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContestantDTO() when $default != null:
return $default(_that.name,_that.symbol,_that.isMainContestant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  TicTacToeSymbolsDTO symbol,  bool isMainContestant)  $default,) {final _that = this;
switch (_that) {
case _ContestantDTO():
return $default(_that.name,_that.symbol,_that.isMainContestant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  TicTacToeSymbolsDTO symbol,  bool isMainContestant)?  $default,) {final _that = this;
switch (_that) {
case _ContestantDTO() when $default != null:
return $default(_that.name,_that.symbol,_that.isMainContestant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContestantDTO extends ContestantDTO {
  const _ContestantDTO({required this.name, required this.symbol, required this.isMainContestant}): super._();
  factory _ContestantDTO.fromJson(Map<String, dynamic> json) => _$ContestantDTOFromJson(json);

@override final  String name;
@override final  TicTacToeSymbolsDTO symbol;
@override final  bool isMainContestant;

/// Create a copy of ContestantDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContestantDTOCopyWith<_ContestantDTO> get copyWith => __$ContestantDTOCopyWithImpl<_ContestantDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContestantDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContestantDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.isMainContestant, isMainContestant) || other.isMainContestant == isMainContestant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,symbol,isMainContestant);

@override
String toString() {
  return 'ContestantDTO(name: $name, symbol: $symbol, isMainContestant: $isMainContestant)';
}


}

/// @nodoc
abstract mixin class _$ContestantDTOCopyWith<$Res> implements $ContestantDTOCopyWith<$Res> {
  factory _$ContestantDTOCopyWith(_ContestantDTO value, $Res Function(_ContestantDTO) _then) = __$ContestantDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, TicTacToeSymbolsDTO symbol, bool isMainContestant
});




}
/// @nodoc
class __$ContestantDTOCopyWithImpl<$Res>
    implements _$ContestantDTOCopyWith<$Res> {
  __$ContestantDTOCopyWithImpl(this._self, this._then);

  final _ContestantDTO _self;
  final $Res Function(_ContestantDTO) _then;

/// Create a copy of ContestantDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? symbol = null,Object? isMainContestant = null,}) {
  return _then(_ContestantDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as TicTacToeSymbolsDTO,isMainContestant: null == isMainContestant ? _self.isMainContestant : isMainContestant // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
