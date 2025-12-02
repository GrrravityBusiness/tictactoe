import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/game_utils.dart';
import 'package:tictactoe/core/widgets/painter/board_painter.dart';
import 'package:tictactoe/core/widgets/painter/winner_line_painter.dart';
import 'package:tictactoe/core/widgets/painter/x_o_painters.dart';

/// Handle a full Tictactoe board painting with X and O elements and
/// winning line if any. is triggered.
///
/// It's also animating the painters for extra polish.
///
/// [board] has a default value representing a sample board. with X and O
/// elements already placed diagonally.
class TicTacToePaintWrapper extends StatelessWidget {
  const TicTacToePaintWrapper({
    this.board = const [1, -1, -1, -1, 0, -1, -1, -1, 1],
    this.strokeWidth = 6,
    super.key,
  }) : assert(board.length == 9, 'Board must have exactly 9 elements');

  final List<int> board;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.onTertiaryContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: TicTacToeBoardPainter(
            strokeWidth: strokeWidth,
          ),
          child: Stack(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: board.length,
                itemBuilder: (context, index) {
                  final xOrO = board[index];
                  return XorOAnimatedPaint(
                    xOrO: xOrO,
                    strokeWidth: strokeWidth,
                  );
                },
              ),
              AnimatedOpacity(
                opacity: GameUtils.hasWinner(board) || GameUtils.isDraw(board)
                    ? 1.0
                    : 0.0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInExpo,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: TicTacToeWinLinePainter(
                    board: board,
                    winLineColor: Colors.amber,
                    strokeWidth: strokeWidth + 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
