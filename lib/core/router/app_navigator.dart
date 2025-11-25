import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/onboarding_page.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/lobby_page.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/utils/logger.dart';

class AppNavigator {
  final Logger _logger = Logger('AppNavigator');
  GoRouter routerBuilder(BuildContext context) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.initialRoute,
      routes: [
        GoRoute(
          path: AppRoutes.lobby,
          builder: (context, state) {
            return const LobbyPage();
          },
        ),
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) {
            return const OnboardingPage();
          },
        ),
      ],
      redirect: (context, state) {
        final location = state.uri.path;
        // Adding a guard on onboarding route to ensure player name is set
        if (location != AppRoutes.onboarding) {
          final playerState = context.read<PlayerController>().state;
          if (playerState.player == null || playerState.player!.name.isEmpty) {
            _logger.other(
              'redirecting to ${AppRoutes.onboarding} from $location',
            );
            return AppRoutes.onboarding;
          }
        }
        return null;
      },
    );
  }
}
