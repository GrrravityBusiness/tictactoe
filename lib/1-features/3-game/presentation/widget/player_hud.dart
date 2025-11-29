import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/utils/game_utils.dart';
import 'package:tictactoe/core/widgets/x_o_painters.dart';

class PlayerHUD extends StatelessWidget {
  const PlayerHUD({
    required this.isMain,
    super.key,
  });

  final bool isMain;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return RotatedBox(
      quarterTurns: isMain ? 0 : 2,
      child: BlocBuilder<GameController, GameState>(
        builder: (context, state) {
          final isActivePlayer =
              (state.currentPlayer == 1 && isMain) ||
              (!isMain && state.currentPlayer == 2);
          final gamer = isMain ? state.player1 : state.player2;
          return DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: isActivePlayer
                  ? [
                      BoxShadow(
                        color: Colors.amberAccent.withValues(alpha: 0.2),
                        blurRadius: 16,
                        spreadRadius: 4,
                        offset: const Offset(0, 20),
                      ),
                    ]
                  : null,
              gradient: isActivePlayer
                  ? LinearGradient(
                      begin: .topCenter,
                      end: .bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.amberAccent.withValues(alpha: 0.8),
                      ],
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Wrap(
                  crossAxisAlignment: .end,
                  alignment: .center,
                  spacing: context.dsTokens.spacing.xlarge,
                  children: [
                    Text(
                      gamer.name,
                      style: theme.textTheme.headlineLarge,
                      textAlign: .center,
                    ),
                    Text(
                      l10n.game_personal_score(gamer.wins),
                    ),
                  ],
                ),
                SizedBox(height: context.dsTokens.spacing.xlarge),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    ...List.generate(
                      gamer.remainingCounts,
                      (index) => SizedBox(
                        width: 60,
                        height: 60,
                        child: CustomPaint(
                          painter: gamer.symbol == XorO.x
                              ? XPainter(color: theme.colorScheme.primary)
                              : OPainter(color: theme.colorScheme.tertiary),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
