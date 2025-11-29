import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/0-onboarding/data/datasource/local_player_datasource.dart';
import 'package:tictactoe/1-features/0-onboarding/data/reporitory_impl/player_repository_impl.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class OnboardingDep {
  /// Inject this feature dependencies into the service locator getIt for easy
  /// access throughout the app.
  ///
  /// This includes datasources, repositories and usecases but should not
  /// include presentation layer dependencies such as Cubits/Blocs.
  /// Use [BlocProvider] or [BlocBuilder] to provide Cubits/Blocs where needed.
  void inject() {
    getIt
      ..registerLazySingleton<LocalPlayerDatasource>(
        () => LocalPlayerDatasource(
          sharedPreferences: getIt<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<PlayerRepository>(
        () => PlayerRepositoryImpl(
          localPlayerDatasource: getIt<LocalPlayerDatasource>(),
        ),
      )
      ..registerLazySingleton<PlayerUseCase>(
        () => PlayerUseCase(
          playerRepository: getIt<PlayerRepository>(),
        ),
      );
  }
}
