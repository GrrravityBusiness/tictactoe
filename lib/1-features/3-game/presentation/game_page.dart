import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/1-features/3-game/presentation/widget/game_gradient_scaffold.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/widgets/tictactoe_painter.dart';
import 'package:tictactoe/core/widgets/x_o_painters.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    required this.player1,
    required this.player2,
    super.key,
  });

  final String player1;
  final String player2;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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

  ({int index, int value}) _handleBoardTap(
    TapUpDetails details,
    BoxConstraints constraints,
    int currentPlayer,
  ) {
    final localPosition = details.localPosition;
    final cellSize = constraints.maxWidth / 3;
    final col = (localPosition.dx ~/ cellSize).clamp(0, 2);
    final row = (localPosition.dy ~/ cellSize).clamp(0, 2);
    final index = row * 3 + col;
    if (currentPlayer == 1) {
      return (index: index, value: 1);
    } else {
      return (index: index, value: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GameGradientScaffold(
      withThemeSwitcher: false,
      body: BlocProvider(
        create: (context) => GameController(
          player1: widget.player1,
          player2: widget.player2,
        ),
        child: Column(
          children: [
            const Expanded(
              child: PlayerHUD(
                isPlayer1: false,
              ),
            ),
            BlocBuilder<GameController, GameState>(
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
                                final move = _handleBoardTap(
                                  details,
                                  constraints,
                                  state.currentPlayer,
                                );
                                if (context.mounted) {
                                  final mademove = context
                                      .read<GameController>()
                                      .makeMove(move);
                                  if (mademove) {
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
                                  color: Colors.white.withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.circular(20),
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
            ),
            const Expanded(
              child: PlayerHUD(
                isPlayer1: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerHUD extends StatelessWidget {
  const PlayerHUD({
    required this.isPlayer1,
    super.key,
  });

  final bool isPlayer1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RotatedBox(
      quarterTurns: isPlayer1 ? 0 : 2,
      child: BlocBuilder<GameController, GameState>(
        builder: (context, state) {
          final isActivePlayer =
              state.currentPlayer == 1 && isPlayer1 ||
              !isPlayer1 && state.currentPlayer == 2;
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
                      isPlayer1 ? state.player1.name : state.player2.name,
                      style: theme.textTheme.headlineLarge,
                      textAlign: .center,
                    ),
                    Text(
                      'Score: ${isPlayer1 ? state.player1.wins : state.player2.wins}',
                    ),
                  ],
                ),
                SizedBox(height: context.dsTokens.spacing.xlarge),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    ...List.generate(
                      isPlayer1
                          ? state.player1.remainingCounts
                          : state.player2.remainingCounts,
                      (index) => SizedBox(
                        width: 60,
                        height: 60,
                        child: isPlayer1
                            ? CustomPaint(
                                painter: XPainter(
                                  color: theme.colorScheme.primary,
                                ),
                              )
                            : CustomPaint(
                                painter: OPainter(
                                  color: theme.colorScheme.tertiary,
                                ),
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
