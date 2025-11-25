import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class DatabaseDep {
  /// Injects the database dependencies into the service locator getIt.
  ///
  /// Dont forget to call [init] after injection to ensure all async
  /// dependencies are ready to use.
  void inject() {
    getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance(),
    );
  }

  /// Initializes the async dependencies as databases opening are often
  /// asynchronous operations.
  ///
  /// Make sure to call this method before [inject]
  Future<void> init() async {
    await getIt.getAsync<SharedPreferences>();
  }
}
