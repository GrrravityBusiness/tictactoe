import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/utils/logger.dart';

part 'failures.freezed.dart';

@freezed
///Standardized Failure class to represent different types of failures
abstract class Failure with _$Failure implements Exception {
  const Failure._();

  /// Failure reflecting a request to a service which
  /// is not in the expected format (e.g a body with wrong
  ///  structure for example)
  const factory Failure.badRequest() = FailureBadRequest;

  /// Failure reflecting a response from a service which
  /// is not in the expected format (e.g a response body which is not matching
  /// the contract for example)
  const factory Failure.badResponse() = FailureBadResponse;

  /// Failure reflecting an unauthorized request to a service usually due to
  /// missing or invalid authentication credentials.
  const factory Failure.unauthorized() = FailureUnauthorized;

  /// Failure reflecting a requested resource not found on a service.
  const factory Failure.elementNotFound() = FailureNotFound;

  /// Failure reflecting a timeout during a request to a service (e.g. when
  /// network is slow or unresponsive).
  const factory Failure.timeout() = FailureTimeout;

  /// Failure reflecting a service being currently unavailable (e.g. service
  ///  down for maintenance).
  const factory Failure.unavailable() = FailureUnavailable;

  /// Failure reflecting any other unexpected error.
  const factory Failure.other() = FailureOther;

  /// Handles [Exception]s thrown during [call] execution.
  /// If a [Failure] is thrown, it is captured and returned as a [Left].
  /// For any other [Exception], it logs the error and returns a generic
  /// [Failure.other].
  static Future<Either<Failure, DataT>> guard<DataT>(
    Future<DataT> Function() call,
  ) async {
    try {
      final result = await call();
      return right(result);
    } on Failure catch (e) {
      return left(e);
    } on Exception catch (e, s) {
      Logger.e(e, stackTrace: s);
      return left(const Failure.other());
    }
  }
}
