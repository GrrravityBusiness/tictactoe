import 'package:flutter/material.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/widgets/tictactoe_painter.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(
          l10n.onboarding_welcome_title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            shadows: [
              const Shadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        TicTacToePainter(theme: theme),
      ],
    );
  }
}
