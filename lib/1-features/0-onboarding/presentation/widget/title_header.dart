import 'package:flutter/material.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/widgets/painter/tictactoe_painter.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(
          l10n.onboarding_welcome_title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        FractionallySizedBox(widthFactor: 0.8, child: TicTacToePaintWrapper()),
        const SizedBox(height: 32),
      ],
    );
  }
}
