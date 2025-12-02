import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';
import 'package:tictactoe/core/widgets/dismiss_keyboard.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.body,
    super.key,
    this.withThemeSwitcher = true,
  });
  final Widget body;
  final bool withThemeSwitcher;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return DismissKeyboard(
      child: Scaffold(
        floatingActionButton: withThemeSwitcher
            ? const ThemeSwitcherWidget()
            : null,
        floatingActionButtonLocation: .miniEndDocked,
        body: body,
      ),
    );
  }
}
