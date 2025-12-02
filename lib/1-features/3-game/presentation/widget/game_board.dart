import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/utils/game_utils.dart';
import 'package:tictactoe/core/widgets/painter/tictactoe_painter.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool loading = false;

  @override
  void initState() {
    // Note : remove status bar at the top for a more immersive experience
    // also because the second player is "upside down" from device perspective.
    // Unawaiting it as it does not need to block the UI.
    unawaited(
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom],
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // Note : restore status bar when leaving the game page as main player
    // should get back his phone in normal perpective
    // Unawaiting it as it does not need to block the UI.
    unawaited(
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      ),
    );
    super.dispose();
  }

  // Note : prevent multiple taps while processing a move
  void toggleLoad() {
    setState(() {
      loading = !loading;
    });
  }

  ({int index, XorO value}) _handleBoardTap(
    Offset localPosition,
    double maxWidth,
    XorO currentSign,
  ) {
    // Note: Calculate tapped cell based on local position using clamp
    // as local position divided with cellSize will return the right index
    // We truncate the division result (~/ operator)
    // as it's enough for our usecase.
    final cellSize = maxWidth / 3;
    final col = (localPosition.dx ~/ cellSize).clamp(0, 2);
    final row = (localPosition.dy ~/ cellSize).clamp(0, 2);
    final index = row * 3 + col;
    if (currentSign == XorO.x) {
      return (index: index, value: XorO.x);
    } else {
      return (index: index, value: XorO.o);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameController, GameState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTapUp: loading
                    ? null
                    : (details) async {
                        if (state.winner != null) {
                          return;
                        }
                        toggleLoad();
                        final selectedCell = _handleBoardTap(
                          details.localPosition,
                          constraints.maxWidth,
                          state.currentPlayer == 1
                              ? state.player1.symbol
                              : state.player2.symbol,
                        );
                        if (context.mounted) {
                          final moveIsValid = context
                              .read<GameController>()
                              .makeMove(selectedCell);
                          if (moveIsValid) {
                            await Future<void>.delayed(
                              const Duration(milliseconds: 500),
                            );
                          }
                          toggleLoad();
                        }
                      },
                child: TicTacToePaintWrapper(
                  board: state.board,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
