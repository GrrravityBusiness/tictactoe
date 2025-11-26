import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';
import 'package:tictactoe/core/widgets/buttons.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              const Text('Hello World!'), //TODO : remove placeholder
              const ThemeSwitcherWidget(),
              SimpleTextButton.secondary(
                onPressed: () => context.go(AppRoutes.onboarding),
                text: l10n.nav_go_to_onboarding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
