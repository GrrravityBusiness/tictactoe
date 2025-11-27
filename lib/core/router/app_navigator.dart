import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/onboarding_page.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/lobby_page.dart';
import 'package:tictactoe/1-features/3-game/presentation/game_page.dart';
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
          name: AppRoutes.lobby,
          path: AppRoutes.lobby,
          pageBuilder: (context, state) => _customPageTransition(
            key: state.pageKey,
            child: const LobbyPage(),
          ),
          routes: [
            GoRoute(
              name: AppRoutes.game,
              path: AppRoutes.game,
              pageBuilder: (context, state) {
                final query = state.uri.queryParameters;
                return _customPageTransition(
                  key: state.pageKey,
                  child: GamePage(
                    player1: query['player1'] ?? '',
                    player2: query['player2'] ?? '',
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.onboarding,
          path: AppRoutes.onboarding,
          pageBuilder: (context, state) => _customPageTransition(
            key: state.pageKey,
            child: const OnboardingPage(),
          ),
        ),
      ],
      redirect: (context, state) {
        final location = state.uri.path;
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

CustomTransitionPage<void> _customPageTransition({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          //Responsible for the stretchings from left/right/top/bottom
          final scale = Tween<double>(begin: 0.1, end: 1)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.elasticOut),
              )
              .value;
          //responsible for the rotation effect
          final rotate = Tween<double>(begin: -0.3, end: 0)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              )
              .value;

          //responsible for the shadow effect on the bottom part of the screen
          final shadowOpacity = Tween<double>(begin: 0.2, end: 0)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeIn))
              .value;

          return Opacity(
            opacity: animation.value,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scaleByDouble(scale, scale, scale, 1)
                ..rotateZ(rotate),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withValues(alpha: shadowOpacity),
                      blurRadius: 24,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          );
        },
      );
    },
  );
}
