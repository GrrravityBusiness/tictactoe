import 'package:get_it/get_it.dart';
import 'package:tictactoe/1-features/0-onboarding/onboarding_dep.dart';
import 'package:tictactoe/core/services/dependency_injection/database_dependency.dart';

GetIt getIt = GetIt.instance;

class DependencyManager {
  /// Initializes and injects all dependencies required by the app.
  ///
  /// Those dependencies are injected into the service locator [getIt] and need
  /// to be initialized in proper order.
  ///
  /// Don't forget to call any async initlization methods when usin
  /// async singletons or factories.
  static Future<void> initDependencies() async {
    DatabaseDep().inject();
    await DatabaseDep().init();
    OnboardingDep().inject();
  }
}
