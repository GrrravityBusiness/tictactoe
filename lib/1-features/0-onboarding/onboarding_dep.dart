import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/0-onboarding/data/datasource/local_player_datasource.dart';
import 'package:tictactoe/1-features/0-onboarding/data/reporitory_impl/player_repository_impl.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class OnboardingDep {
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
