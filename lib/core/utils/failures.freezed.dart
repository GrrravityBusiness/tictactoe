// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FailureBadRequest value)?  badRequest,TResult Function( FailureBadResponse value)?  badResponse,TResult Function( FailureUnauthorized value)?  unauthorized,TResult Function( FailureNotFound value)?  elementNotFound,TResult Function( FailureTimeout value)?  timeout,TResult Function( FailureUnavailable value)?  unavailable,TResult Function( FailureOther value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FailureBadRequest() when badRequest != null:
return badRequest(_that);case FailureBadResponse() when badResponse != null:
return badResponse(_that);case FailureUnauthorized() when unauthorized != null:
return unauthorized(_that);case FailureNotFound() when elementNotFound != null:
return elementNotFound(_that);case FailureTimeout() when timeout != null:
return timeout(_that);case FailureUnavailable() when unavailable != null:
return unavailable(_that);case FailureOther() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FailureBadRequest value)  badRequest,required TResult Function( FailureBadResponse value)  badResponse,required TResult Function( FailureUnauthorized value)  unauthorized,required TResult Function( FailureNotFound value)  elementNotFound,required TResult Function( FailureTimeout value)  timeout,required TResult Function( FailureUnavailable value)  unavailable,required TResult Function( FailureOther value)  other,}){
final _that = this;
switch (_that) {
case FailureBadRequest():
return badRequest(_that);case FailureBadResponse():
return badResponse(_that);case FailureUnauthorized():
return unauthorized(_that);case FailureNotFound():
return elementNotFound(_that);case FailureTimeout():
return timeout(_that);case FailureUnavailable():
return unavailable(_that);case FailureOther():
return other(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FailureBadRequest value)?  badRequest,TResult? Function( FailureBadResponse value)?  badResponse,TResult? Function( FailureUnauthorized value)?  unauthorized,TResult? Function( FailureNotFound value)?  elementNotFound,TResult? Function( FailureTimeout value)?  timeout,TResult? Function( FailureUnavailable value)?  unavailable,TResult? Function( FailureOther value)?  other,}){
final _that = this;
switch (_that) {
case FailureBadRequest() when badRequest != null:
return badRequest(_that);case FailureBadResponse() when badResponse != null:
return badResponse(_that);case FailureUnauthorized() when unauthorized != null:
return unauthorized(_that);case FailureNotFound() when elementNotFound != null:
return elementNotFound(_that);case FailureTimeout() when timeout != null:
return timeout(_that);case FailureUnavailable() when unavailable != null:
return unavailable(_that);case FailureOther() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  badRequest,TResult Function()?  badResponse,TResult Function()?  unauthorized,TResult Function()?  elementNotFound,TResult Function()?  timeout,TResult Function()?  unavailable,TResult Function()?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FailureBadRequest() when badRequest != null:
return badRequest();case FailureBadResponse() when badResponse != null:
return badResponse();case FailureUnauthorized() when unauthorized != null:
return unauthorized();case FailureNotFound() when elementNotFound != null:
return elementNotFound();case FailureTimeout() when timeout != null:
return timeout();case FailureUnavailable() when unavailable != null:
return unavailable();case FailureOther() when other != null:
return other();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  badRequest,required TResult Function()  badResponse,required TResult Function()  unauthorized,required TResult Function()  elementNotFound,required TResult Function()  timeout,required TResult Function()  unavailable,required TResult Function()  other,}) {final _that = this;
switch (_that) {
case FailureBadRequest():
return badRequest();case FailureBadResponse():
return badResponse();case FailureUnauthorized():
return unauthorized();case FailureNotFound():
return elementNotFound();case FailureTimeout():
return timeout();case FailureUnavailable():
return unavailable();case FailureOther():
return other();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  badRequest,TResult? Function()?  badResponse,TResult? Function()?  unauthorized,TResult? Function()?  elementNotFound,TResult? Function()?  timeout,TResult? Function()?  unavailable,TResult? Function()?  other,}) {final _that = this;
switch (_that) {
case FailureBadRequest() when badRequest != null:
return badRequest();case FailureBadResponse() when badResponse != null:
return badResponse();case FailureUnauthorized() when unauthorized != null:
return unauthorized();case FailureNotFound() when elementNotFound != null:
return elementNotFound();case FailureTimeout() when timeout != null:
return timeout();case FailureUnavailable() when unavailable != null:
return unavailable();case FailureOther() when other != null:
return other();case _:
  return null;

}
}

}

/// @nodoc


class FailureBadRequest extends Failure {
  const FailureBadRequest(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureBadRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.badRequest()';
}


}




/// @nodoc


class FailureBadResponse extends Failure {
  const FailureBadResponse(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureBadResponse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.badResponse()';
}


}




/// @nodoc


class FailureUnauthorized extends Failure {
  const FailureUnauthorized(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unauthorized()';
}


}




/// @nodoc


class FailureNotFound extends Failure {
  const FailureNotFound(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.elementNotFound()';
}


}




/// @nodoc


class FailureTimeout extends Failure {
  const FailureTimeout(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.timeout()';
}


}




/// @nodoc


class FailureUnavailable extends Failure {
  const FailureUnavailable(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unavailable()';
}


}




/// @nodoc


class FailureOther extends Failure {
  const FailureOther(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureOther);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.other()';
}


}




// dart format on
