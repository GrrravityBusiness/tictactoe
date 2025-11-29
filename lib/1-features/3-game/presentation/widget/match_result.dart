import 'package:flutter/material.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';

class MatchResultModal extends StatelessWidget {
  const MatchResultModal({
    required this.state,
    required this.onBackToLobby,
    required this.onPlayAgain,
    super.key,
  });

  final GameState state;
  final VoidCallback onBackToLobby;
  final VoidCallback onPlayAgain;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Dialog(
      insetPadding: .all(context.dsTokens.spacing.large),
      child: Padding(
        padding: .all(context.dsTokens.spacing.large),
        child: Column(
          mainAxisSize: .min,
          children: [
            const SizedBox(height: 16),
            _ResultContent(state: state),
            Padding(
              padding: const .symmetric(vertical: 18),
              child: Divider(
                thickness: 4,
                radius: .circular(8),
              ),
            ),
            _ResultContent(state: state, isMainPlayer: true),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: Text(
                    l10n.game_result_back_lobby_action,
                    style: theme.textTheme.bodySmall,
                  ),
                  onPressed: onBackToLobby,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    l10n.game_result_continue_play_action,
                    style: theme.textTheme.bodySmall,
                  ),
                  onPressed: onPlayAgain,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  const _ResultContent({
    required this.state,
    this.isMainPlayer = false,
  });

  final GameState state;
  final bool isMainPlayer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return RotatedBox(
      quarterTurns: isMainPlayer ? 0 : 2,
      child: Column(
        children: [
          Text(
            state.winner != null
                ? l10n.game_result_winner_text(state.winner!.name)
                : l10n.game_result_draw_text,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: .bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '${state.player1.name} (${state.player1.wins})', // Customize this to show winner/draw
            style: theme.textTheme.bodyMedium,
            textAlign: .center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.game_result_vs_text, // Customize this to show winner/draw
            style: theme.textTheme.bodyMedium,
            textAlign: .center,
          ),
          const SizedBox(height: 8),
          Text(
            '${state.player2.name} (${state.player2.wins})', // Customize this to show winner/draw
            style: theme.textTheme.bodyMedium,
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
