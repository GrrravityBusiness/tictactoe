import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_value.freezed.dart';

@freezed
///Sealed class representing an asynchronous value with loading, loaded,
/// and failure states to help manage async data in the application from
/// controllers to UI layers.
/// the purpose is to have a unified way to represent async data with
/// methods shortcutting common operations like checking state,
/// retrieving data, converting between states, etc...
/// [DataT] is the type of the data being handled.
/// [MetadataT] is an optional type for any metadata associated with the
/// async operation. could be used for pagination info, timestamps, etc.
/// [AsyncValueError] also captures an [Exception] to handle failures properly
///
/// Example usage:
/// ```dart
/// final asyncValue = AsyncValue<MyData, MyMetadata>.loading();
/// final data = asyncValue.dataOrThrow; // Throws if not loaded
/// final newStateAsLoaded = asyncValue.asLoaded; // Converts to loaded state if possible
/// final updatedDatas= asyncValue.copyWithData(newData);
/// //...
/// ```
sealed class AsyncValue<DataT, MetadataT> with _$AsyncValue<DataT, MetadataT> {
  AsyncValue._();

  factory AsyncValue.loading({
    DataT? data,
    MetadataT? metadata,
  }) = AsyncValueLoading;

  factory AsyncValue.loaded({
    required DataT data,
    MetadataT? metadata,
  }) = AsyncValueLoaded;

  factory AsyncValue.failure({
    required Exception failure,
    DataT? data,
    MetadataT? metadata,
  }) = AsyncValueError;

  AsyncValueLoaded<DataT, MetadataT>? get asLoaded => map(
    loaded: (value) => value,
    loading: (value) {
      final data = value.data;
      if (data != null) {
        return AsyncValueLoaded<DataT, MetadataT>(
          data: data,
          metadata: value.metadata,
        );
      }
      return null;
    },
    failure: (value) {
      final data = value.data;
      if (data != null) {
        return AsyncValueLoaded<DataT, MetadataT>(
          data: data,
          metadata: value.metadata,
        );
      }
      return null;
    },
  );
  AsyncValueLoading<DataT, MetadataT> get toLoading => map(
    loading: (loading) => loading,
    loaded: (loaded) =>
        AsyncValueLoading(data: loaded.data, metadata: loaded.metadata),
    failure: (value) =>
        AsyncValueLoading(data: value.data, metadata: value.metadata),
  );

  AsyncValueError<DataT, MetadataT> toFailure(Exception failure) =>
      AsyncValueError(data: data, metadata: metadata, failure: failure);
}

extension AsyncValueX<DataT, MetadataT> on AsyncValue<DataT, MetadataT> {
  bool get isLoading => this is AsyncValueLoading;
  bool get isLoaded => this is AsyncValueLoaded;
  bool get isFailure => failure != null;

  bool get hasValue => data != null;

  Exception? get failure => map(
    loading: (loading) => null,
    loaded: (loaded) => null,
    failure: (failure) => failure.failure,
  );

  StackTrace? get stackTrace => map(
    loading: (loading) => null,
    loaded: (loaded) => null,
    failure: (failure) => failure.stackTrace,
  );

  DataT get dataOrThrow => map(
    loaded: (loaded) => loaded.data,
    failure: (failure) {
      if (failure.data == null) {
        throw Exception('Bad state, expected loaded but got $this');
      }
      return failure.data!;
    },
    loading: (loading) {
      if (loading.data == null) {
        throw Exception('Bad state, expected loaded but got $this');
      }
      return loading.data!;
    },
  );

  AsyncValue<DataT, MetadataT> copyWithData(DataT? data) {
    return map(
      loading: (value) {
        return value.copyWith(
          data: data ?? value.data,
          metadata: value.metadata,
        );
      },
      loaded: (value) {
        return value.copyWith(
          data: data ?? value.data,
          metadata: value.metadata,
        );
      },
      failure: (value) {
        return value.copyWith(
          data: data ?? value.data,
          metadata: value.metadata,
          failure: value.failure,
        );
      },
    );
  }
}
