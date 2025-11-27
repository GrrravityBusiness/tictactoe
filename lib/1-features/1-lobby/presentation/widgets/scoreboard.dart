import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';

class ScoreBoardModal extends StatelessWidget {
  const ScoreBoardModal({
    required this.histories,
    super.key,
  });

  final List<History> histories;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dsTokens = context.dsTokens;

    return Dialog(
      insetPadding: EdgeInsets.all(dsTokens.spacing.large),
      child: Padding(
        padding: EdgeInsets.all(context.dsTokens.spacing.large),
        child: CustomScrollView(
          slivers: [
            const PinnedHeaderSliver(
              child: _ScoreboardHeader(),
            ),
            if (histories.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    'Scoreboard is empty for now.',
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              )
            else
              SliverList.builder(
                itemBuilder: (context, index) {
                  final score = histories[index];
                  final playerPoints = score.playerScore.points;
                  final opponentPoints = score.opponentScore.points;
                  final isPlayerWinner = playerPoints > opponentPoints;
                  final isDraw = playerPoints == opponentPoints;
                  return _ScoreLine(
                    isPlayerWinner: isPlayerWinner,
                    isDraw: isDraw,
                    score: score,
                    l10n: l10n,
                    theme: theme,
                  );
                },
                itemCount: histories.length,
              ),
          ],
        ),
      ),
    );
  }
}

class _ScoreLine extends StatelessWidget {
  const _ScoreLine({
    required this.isPlayerWinner,
    required this.isDraw,
    required this.score,
    required this.l10n,
    required this.theme,
  });

  final bool isPlayerWinner;
  final bool isDraw;
  final History score;
  final AppLocalizations l10n;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.dsTokens.spacing.medium,
      ),
      child: _ScoreGradientContainer(
        isPlayerWinner: isPlayerWinner,
        isDraw: isDraw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ContestantText(
              score: score.playerScore,
              isWinner: isPlayerWinner,
              isLooser: !isPlayerWinner && !isDraw,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                isDraw ? l10n.scoreboard_vs_draw : l10n.scoreboard_vs_winner,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDraw
                      ? theme.colorScheme.secondary
                      : theme.colorScheme.primary,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
            ),
            _ContestantText(
              score: score.opponentScore,
              isWinner: !isPlayerWinner,
              isLooser: !isPlayerWinner && !isDraw,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreboardHeader extends StatelessWidget {
  const _ScoreboardHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerHigh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.lobby_scoreboard_title,
            style: theme.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}

class _ScoreGradientContainer extends StatelessWidget {
  const _ScoreGradientContainer({
    required this.isPlayerWinner,
    required this.isDraw,
    required this.child,
  });
  final bool isPlayerWinner;
  final bool isDraw;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: isDraw
            ? LinearGradient(
                colors: [
                  theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.5,
                  ),
                  theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.5,
                  ),
                ],
              )
            : (isPlayerWinner
                  ? LinearGradient(
                      colors: [
                        theme.colorScheme.primary.withValues(
                          alpha: 0.18,
                        ),
                        Colors.transparent,
                      ],
                    )
                  : LinearGradient(
                      colors: [
                        Colors.transparent,
                        theme.colorScheme.onSurface.withValues(
                          alpha: 0.18,
                        ),
                      ],
                    )),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      child: child,
    );
  }
}

class _ContestantText extends StatelessWidget {
  const _ContestantText({
    required this.score,
    required this.isWinner,
    required this.isLooser,
  });
  final Score score;
  final bool isWinner;
  final bool isLooser;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Text(
        '${score.contestant.name} (${score.points})',
        style: theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: isWinner
              ? theme.colorScheme.primary
              : isLooser
              ? theme.colorScheme.onSurface.withValues(
                  alpha: 0.6,
                )
              : theme.colorScheme.secondary,
          fontSize: isLooser ? 16 : 18,
          shadows: isWinner
              ? [
                  Shadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(1, 1),
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
