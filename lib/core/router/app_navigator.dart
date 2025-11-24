import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/lobby_page.dart';
import 'package:tictactoe/core/router/routes.dart';

class AppNavigator {
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
      ],
    );
  }
}
