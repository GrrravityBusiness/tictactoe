import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              const Text('Hello World!'),
              const ThemeSwitcherWidget(),
              TextButton(
                onPressed: () => context.go(AppRoutes.onboarding),
                child: const Text('Go to Onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
