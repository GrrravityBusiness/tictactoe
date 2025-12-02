import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/main_scaffold.dart';

class GameGradientScaffold extends StatelessWidget {
  const GameGradientScaffold({
    required this.body,
    super.key,
  });
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MainScaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.tertiaryContainer.withValues(alpha: 0.3),
              theme.scaffoldBackgroundColor,
              theme.scaffoldBackgroundColor,
              theme.colorScheme.tertiaryContainer.withValues(alpha: 0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}
