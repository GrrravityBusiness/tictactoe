import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';
import 'package:tictactoe/core/widgets/dismiss_keyboard.dart';

class GameGradientScaffold extends StatelessWidget {
  const GameGradientScaffold({
    required this.body,
    super.key,
    this.withThemeSwitcher = true,
  });
  final Widget body;
  final bool withThemeSwitcher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DismissKeyboard(
      child: Scaffold(
        floatingActionButton: withThemeSwitcher
            ? const ThemeSwitcherWidget()
            : null,
        floatingActionButtonLocation: .miniEndDocked,
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onSecondary
                else
                  theme.colorScheme.onPrimary,
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onPrimary
                else
                  theme.colorScheme.primary,
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onPrimary
                else
                  theme.colorScheme.primary,
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onSecondary
                else
                  theme.colorScheme.onPrimary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}
