import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/3-game/data/datasource/score_datasource.dart';
import 'package:tictactoe/1-features/3-game/data/repository_impl/score_repository_impl.dart';
import 'package:tictactoe/1-features/3-game/domain/repositories/score_repository.dart';
import 'package:tictactoe/1-features/3-game/domain/usecase/score_usecase.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class GameDep {
  /// Inject this feature dependencies into the service locator getIt for easy
  /// access throughout the app.
  ///
  /// This includes datasources, repositories and usecases but should not
  /// include presentation layer dependencies such as Cubits/Blocs.
  /// Use [BlocProvider] or [BlocBuilder] to provide Cubits/Blocs where needed.
  void inject() {
    getIt
      ..registerLazySingleton<ScoreDatasource>(
        () => ScoreDatasource(
          sharedPreferences: getIt<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<ScoreRepository>(
        () => ScoreRepositoryImpl(
          scoreDatasource: getIt<ScoreDatasource>(),
        ),
      )
      ..registerLazySingleton<ScoreUsecase>(
        () => ScoreUsecase(
          scoreRepository: getIt<ScoreRepository>(),
        ),
      );
  }
}
