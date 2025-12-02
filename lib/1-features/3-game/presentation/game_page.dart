import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/3-game/domain/usecase/score_usecase.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/1-features/3-game/presentation/widget/game_board.dart';
import 'package:tictactoe/1-features/3-game/presentation/widget/game_gradient_scaffold.dart';
import 'package:tictactoe/1-features/3-game/presentation/widget/match_result.dart';
import 'package:tictactoe/1-features/3-game/presentation/widget/player_hud.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    required this.player1,
    required this.player2,
    super.key,
  });

  final String player1;
  final String player2;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GameGradientScaffold(
      withThemeSwitcher: false,
      body: BlocProvider(
        create: (context) => GameController(
          player1: player1,
          player2: player2,
          scoreUsecase: getIt<ScoreUsecase>(),
        ),
        child: BlocListener<GameController, GameState>(
          listener: (BuildContext context, GameState state) async {
            if (state.result != null) {
              await Future<void>.delayed(
                const Duration(seconds: 2),
              );
              if (context.mounted) {
                final playAgain = await showGeneralDialog<bool>(
                  context: context,
                  barrierLabel: l10n.game_result_dialog_label,
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (context, anim1, anim2) {
                    return const SizedBox.shrink();
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1,
                      child: MatchResultModal(
                        state: state,
                        onBackToLobby: () {
                          context.pop(false);
                        },
                        onPlayAgain: () {
                          context.pop(true);
                        },
                      ),
                    );
                  },
                );
                if (context.mounted) {
                  if (!(playAgain ?? false)) {
                    await context.read<GameController>().saveScores();
                    if (context.mounted) {
                      context.pop();
                    }
                  } else {
                    context.read<GameController>().nextGame();
                  }
                }
              }
            }
          },
          listenWhen: (previous, current) => current.result != null,
          child: const Column(
            children: [
              Expanded(child: PlayerHUD(isMain: false)),
              GameBoard(),
              Expanded(child: PlayerHUD(isMain: true)),
            ],
          ),
        ),
      ),
    );
  }
}
