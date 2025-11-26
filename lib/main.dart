import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/app_navigator.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_cubit.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_state.dart';
import 'package:tictactoe/core/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyManager.initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
        BlocProvider<PlayerController>(
          create: (context) => PlayerController(
            playerUseCase: getIt<PlayerUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeController, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.themeData.baseTheme,
            routerConfig: AppNavigator().routerBuilder(context),
            scaffoldMessengerKey: Constants.snackbarKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
