import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/utils/game_utils.dart';
import 'package:tictactoe/core/widgets/tictactoe_painter.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool loading = false;

  @override
  void initState() {
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
    unawaited(
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      ),
    );
    super.dispose();
  }

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
            final theme = Theme.of(context);
            return AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTapUp: loading
                    ? null
                    : (details) async {
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
                child: Container(
                  decoration: theme.brightness == Brightness.dark
                      ? null
                      : BoxDecoration(
                          color: Colors.white.withValues(
                            alpha: 0.4,
                          ),
                          borderRadius: .circular(20),
                        ),
                  child: TicTacToePainter(
                    board: state.board,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
