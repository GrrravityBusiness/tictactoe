import 'package:dartz/dartz.dart';

/// Extension methods for [Either] to simplify access and async operations.
extension EitherX<L, R> on Either<L, R> {
  /// Returns the right value.
  /// This will throws if this is not a [Right] so use [getRightOrNull]
  /// for failsafe cases.
  R getRight() => (this as Right).value as R;

  /// Returns the left value.
  /// This will throws if this is not a [Left] so use [getLeftOrNull]
  /// for failsafe cases.
  L getLeft() => (this as Left).value as L;

  /// Returns the right value if present, otherwise null.
  R? getRightOrNull() => isRight() ? (this as Right).value as R : null;

  /// Returns the left value if present, otherwise null.
  L? getLeftOrNull() => isLeft() ? (this as Left).value as L : null;

  /// Binds a future function to the right value, propagating left.
  Future<Either<L, R2>> bindFuture<R2>(Function1<R, Future<Either<L, R2>>> f) =>
      fold(
        (l) => Future.microtask(() => left(l)),
        (R r) => f(r),
      );

  /// Maps the right value asynchronously, propagating left.
  Future<Either<L, R2>> mapFuture<R2>(Function1<R, Future<R2>> f) => fold(
    (l) => Future.microtask(() => left(l)),
    (r) => f(r).then(right),
  );
}

/// Extension methods for Future<[Either]> to simplify async
/// chaining and mapping.
extension FutureEitherX<L, R> on Future<Either<L, R>> {
  /// Binds a future function to the right value, propagating left.
  Future<Either<L, R2>> bindFuture<R2>(Function1<R, Future<Either<L, R2>>> f) =>
      then(
        (value) => value.fold(
          (l) => Future.microtask(() => left(l)),
          (R r) => f(r),
        ),
      );

  /// Binds a function returning [Either] to the right value, propagating left.
  Future<Either<L, R2>> bind<R2>(Function1<R, Either<L, R2>> f) => then(
    (value) => value.fold(
      left,
      f,
    ),
  );

  /// Folds the result asynchronously into a value of generic type [B].
  Future<B> fold<B>(
    B Function(L l) ifLeft,
    B Function(R r) ifRight,
  ) => then(
    (value) => value.fold(
      ifLeft,
      ifRight,
    ),
  );

  /// Folds the result asynchronously into a value of generic type [B]
  ///  using async functions.
  Future<B> foldAsync<B>(
    Future<B> Function(L l) ifLeft,
    Future<B> Function(R r) ifRight,
  ) async {
    final either = await this;
    return either.fold(
      (l) => ifLeft(l),
      (r) => ifRight(r),
    );
  }

  /// Maps the right value asynchronously, propagating left.
  Future<Either<L, R2>> mapFuture<R2>(Function1<R, Future<R2>> f) => then(
    (value) => value.fold(
      left,
      (r) => f(r).then(right),
    ),
  );

  /// Maps the right value synchronously, propagating left.
  Future<Either<L, R2>> map<R2>(Function1<R, R2> f) => then(
    (value) => value.fold(
      left,
      (r) => right(f(r)),
    ),
  );
}
