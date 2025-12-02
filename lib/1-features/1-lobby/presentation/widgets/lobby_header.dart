import 'package:flutter/material.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/widgets/painter/tictactoe_painter.dart';

class LobbyHeader extends StatelessWidget {
  const LobbyHeader({
    required this.playerName,
    super.key,
  });
  final String playerName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dsTokens.spacing.medium,
          ),
          child: Text(
            l10n.lobby_welcome_message(
              playerName,
            ),
            style: theme.textTheme.headlineMedium,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          padding: EdgeInsets.all(
            context.dsTokens.spacing.large,
          ),
          child: TicTacToePaintWrapper(
            strokeWidth: 4,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
