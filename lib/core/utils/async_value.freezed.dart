// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncValue<DataT,MetadataT> {

 DataT? get data; MetadataT? get metadata;
/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueCopyWith<DataT, MetadataT, AsyncValue<DataT, MetadataT>> get copyWith => _$AsyncValueCopyWithImpl<DataT, MetadataT, AsyncValue<DataT, MetadataT>>(this as AsyncValue<DataT, MetadataT>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValue<DataT, MetadataT>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AsyncValue<$DataT, $MetadataT>(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AsyncValueCopyWith<DataT,MetadataT,$Res>  {
  factory $AsyncValueCopyWith(AsyncValue<DataT, MetadataT> value, $Res Function(AsyncValue<DataT, MetadataT>) _then) = _$AsyncValueCopyWithImpl;
@useResult
$Res call({
 MetadataT? metadata
});




}
/// @nodoc
class _$AsyncValueCopyWithImpl<DataT,MetadataT,$Res>
    implements $AsyncValueCopyWith<DataT, MetadataT, $Res> {
  _$AsyncValueCopyWithImpl(this._self, this._then);

  final AsyncValue<DataT, MetadataT> _self;
  final $Res Function(AsyncValue<DataT, MetadataT>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = freezed,}) {
  return _then(_self.copyWith(
metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataT?,
  ));
}

}


/// Adds pattern-matching-related methods to [AsyncValue].
extension AsyncValuePatterns<DataT,MetadataT> on AsyncValue<DataT, MetadataT> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncValueLoading<DataT, MetadataT> value)?  loading,TResult Function( AsyncValueLoaded<DataT, MetadataT> value)?  loaded,TResult Function( AsyncValueError<DataT, MetadataT> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncValueLoading() when loading != null:
return loading(_that);case AsyncValueLoaded() when loaded != null:
return loaded(_that);case AsyncValueError() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncValueLoading<DataT, MetadataT> value)  loading,required TResult Function( AsyncValueLoaded<DataT, MetadataT> value)  loaded,required TResult Function( AsyncValueError<DataT, MetadataT> value)  failure,}){
final _that = this;
switch (_that) {
case AsyncValueLoading():
return loading(_that);case AsyncValueLoaded():
return loaded(_that);case AsyncValueError():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncValueLoading<DataT, MetadataT> value)?  loading,TResult? Function( AsyncValueLoaded<DataT, MetadataT> value)?  loaded,TResult? Function( AsyncValueError<DataT, MetadataT> value)?  failure,}){
final _that = this;
switch (_that) {
case AsyncValueLoading() when loading != null:
return loading(_that);case AsyncValueLoaded() when loaded != null:
return loaded(_that);case AsyncValueError() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DataT? data,  MetadataT? metadata)?  loading,TResult Function( DataT data,  MetadataT? metadata)?  loaded,TResult Function( Exception failure,  DataT? data,  MetadataT? metadata)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncValueLoading() when loading != null:
return loading(_that.data,_that.metadata);case AsyncValueLoaded() when loaded != null:
return loaded(_that.data,_that.metadata);case AsyncValueError() when failure != null:
return failure(_that.failure,_that.data,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DataT? data,  MetadataT? metadata)  loading,required TResult Function( DataT data,  MetadataT? metadata)  loaded,required TResult Function( Exception failure,  DataT? data,  MetadataT? metadata)  failure,}) {final _that = this;
switch (_that) {
case AsyncValueLoading():
return loading(_that.data,_that.metadata);case AsyncValueLoaded():
return loaded(_that.data,_that.metadata);case AsyncValueError():
return failure(_that.failure,_that.data,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DataT? data,  MetadataT? metadata)?  loading,TResult? Function( DataT data,  MetadataT? metadata)?  loaded,TResult? Function( Exception failure,  DataT? data,  MetadataT? metadata)?  failure,}) {final _that = this;
switch (_that) {
case AsyncValueLoading() when loading != null:
return loading(_that.data,_that.metadata);case AsyncValueLoaded() when loaded != null:
return loaded(_that.data,_that.metadata);case AsyncValueError() when failure != null:
return failure(_that.failure,_that.data,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class AsyncValueLoading<DataT,MetadataT> extends AsyncValue<DataT, MetadataT> {
   AsyncValueLoading({this.data, this.metadata}): super._();
  

@override final  DataT? data;
@override final  MetadataT? metadata;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueLoadingCopyWith<DataT, MetadataT, AsyncValueLoading<DataT, MetadataT>> get copyWith => _$AsyncValueLoadingCopyWithImpl<DataT, MetadataT, AsyncValueLoading<DataT, MetadataT>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueLoading<DataT, MetadataT>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AsyncValue<$DataT, $MetadataT>.loading(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AsyncValueLoadingCopyWith<DataT,MetadataT,$Res> implements $AsyncValueCopyWith<DataT, MetadataT, $Res> {
  factory $AsyncValueLoadingCopyWith(AsyncValueLoading<DataT, MetadataT> value, $Res Function(AsyncValueLoading<DataT, MetadataT>) _then) = _$AsyncValueLoadingCopyWithImpl;
@override @useResult
$Res call({
 DataT? data, MetadataT? metadata
});




}
/// @nodoc
class _$AsyncValueLoadingCopyWithImpl<DataT,MetadataT,$Res>
    implements $AsyncValueLoadingCopyWith<DataT, MetadataT, $Res> {
  _$AsyncValueLoadingCopyWithImpl(this._self, this._then);

  final AsyncValueLoading<DataT, MetadataT> _self;
  final $Res Function(AsyncValueLoading<DataT, MetadataT>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(AsyncValueLoading<DataT, MetadataT>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataT?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataT?,
  ));
}


}

/// @nodoc


class AsyncValueLoaded<DataT,MetadataT> extends AsyncValue<DataT, MetadataT> {
   AsyncValueLoaded({required this.data, this.metadata}): super._();
  

@override final  DataT data;
@override final  MetadataT? metadata;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueLoadedCopyWith<DataT, MetadataT, AsyncValueLoaded<DataT, MetadataT>> get copyWith => _$AsyncValueLoadedCopyWithImpl<DataT, MetadataT, AsyncValueLoaded<DataT, MetadataT>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueLoaded<DataT, MetadataT>&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AsyncValue<$DataT, $MetadataT>.loaded(data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AsyncValueLoadedCopyWith<DataT,MetadataT,$Res> implements $AsyncValueCopyWith<DataT, MetadataT, $Res> {
  factory $AsyncValueLoadedCopyWith(AsyncValueLoaded<DataT, MetadataT> value, $Res Function(AsyncValueLoaded<DataT, MetadataT>) _then) = _$AsyncValueLoadedCopyWithImpl;
@override @useResult
$Res call({
 DataT data, MetadataT? metadata
});




}
/// @nodoc
class _$AsyncValueLoadedCopyWithImpl<DataT,MetadataT,$Res>
    implements $AsyncValueLoadedCopyWith<DataT, MetadataT, $Res> {
  _$AsyncValueLoadedCopyWithImpl(this._self, this._then);

  final AsyncValueLoaded<DataT, MetadataT> _self;
  final $Res Function(AsyncValueLoaded<DataT, MetadataT>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? metadata = freezed,}) {
  return _then(AsyncValueLoaded<DataT, MetadataT>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataT,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataT?,
  ));
}


}

/// @nodoc


class AsyncValueError<DataT,MetadataT> extends AsyncValue<DataT, MetadataT> {
   AsyncValueError({required this.failure, this.data, this.metadata}): super._();
  

 final  Exception failure;
@override final  DataT? data;
@override final  MetadataT? metadata;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncValueErrorCopyWith<DataT, MetadataT, AsyncValueError<DataT, MetadataT>> get copyWith => _$AsyncValueErrorCopyWithImpl<DataT, MetadataT, AsyncValueError<DataT, MetadataT>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncValueError<DataT, MetadataT>&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,failure,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'AsyncValue<$DataT, $MetadataT>.failure(failure: $failure, data: $data, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AsyncValueErrorCopyWith<DataT,MetadataT,$Res> implements $AsyncValueCopyWith<DataT, MetadataT, $Res> {
  factory $AsyncValueErrorCopyWith(AsyncValueError<DataT, MetadataT> value, $Res Function(AsyncValueError<DataT, MetadataT>) _then) = _$AsyncValueErrorCopyWithImpl;
@override @useResult
$Res call({
 Exception failure, DataT? data, MetadataT? metadata
});




}
/// @nodoc
class _$AsyncValueErrorCopyWithImpl<DataT,MetadataT,$Res>
    implements $AsyncValueErrorCopyWith<DataT, MetadataT, $Res> {
  _$AsyncValueErrorCopyWithImpl(this._self, this._then);

  final AsyncValueError<DataT, MetadataT> _self;
  final $Res Function(AsyncValueError<DataT, MetadataT>) _then;

/// Create a copy of AsyncValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? data = freezed,Object? metadata = freezed,}) {
  return _then(AsyncValueError<DataT, MetadataT>(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Exception,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DataT?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataT?,
  ));
}


}

// dart format on
