import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/contestant_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/history_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/repository_impl/contestant_repository_impl.dart';
import 'package:tictactoe/1-features/1-lobby/data/repository_impl/history_repository_impl.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/history_repository.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class LobbyDep {
  /// Inject this feature dependencies into the service locator getIt for easy
  /// access throughout the app.
  ///
  /// This includes datasources, repositories and usecases but should not
  /// include presentation layer dependencies such as Cubits/Blocs.
  /// Use [BlocProvider] or [BlocBuilder] to provide Cubits/Blocs where needed.
  void inject() {
    getIt
      ..registerLazySingleton<ContestantSource>(
        () => ContestantSource(
          sharedPreferences: getIt<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<HistorySource>(
        () => HistorySource(
          sharedPreferences: getIt<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<ContestantRepository>(
        () => ContestantRepositoryImpl(
          contestantSource: getIt<ContestantSource>(),
        ),
      )
      ..registerLazySingleton<HistoryRepository>(
        () => HistoryRepositoryImpl(
          historySource: getIt<HistorySource>(),
        ),
      )
      ..registerLazySingleton<ContestantUseCase>(
        () => ContestantUseCase(
          contestantRepository: getIt<ContestantRepository>(),
        ),
      )
      ..registerLazySingleton<HistoryUseCase>(
        () => HistoryUseCase(
          historyRepository: getIt<HistoryRepository>(),
        ),
      );
  }
}
