import 'package:get_it/get_it.dart';
import 'package:tictactoe/1-features/0-onboarding/onboarding_dep.dart';
import 'package:tictactoe/core/services/dependency_injection/database_dependency.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  DatabaseDep().inject();
  await DatabaseDep().init();
  OnboardingDep().inject();
}
