import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class DatabaseDep {
  void inject() {
    getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    );
  }

  Future<void> init() async {
    await getIt.getAsync<SharedPreferences>();
  }
}
