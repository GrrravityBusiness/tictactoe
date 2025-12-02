import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

/// Custom painter for a stylized winner line in Tic Tac Toe.
///
/// It will draw a line over the winning pattern when applicable.
///
/// A winning pattern is either a horizontal, vertical, or diagonal line
/// of the same symbol (X or O) on the Tic Tac Toe board.
class TicTacToeWinLinePainter extends CustomPainter {
  TicTacToeWinLinePainter({
    required this.board,
    required this.winLineColor,
    this.strokeWidth = 6,
  });

  final List<int> board;
  final Color winLineColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    for (final winningCandidate in XorO.values) {
      _drawWinLine(
        canvas: canvas,
        size: size,
        winningValue: winningCandidate.symbolValue,
      );
    }
  }

  /// Draws a line over the winning pattern where applicable.
  void _drawWinLine({
    required Canvas canvas,
    required Size size,
    required int winningValue,
  }) {
    final cellSize = size.width / 3;
    final winPaint = Paint()
      ..color = winLineColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final winPattern = GameUtils.getWinningPattern(board, winningValue);

    if (winPattern != null) {
      Offset start;
      Offset end;
      if (winPattern[0] ~/ 3 == winPattern[1] ~/ 3 &&
          winPattern[1] ~/ 3 == winPattern[2] ~/ 3) {
        // Horizontal
        final row = winPattern[0] ~/ 3;
        start = Offset(cellSize * 0.1, cellSize * (row + 0.5));
        end = Offset(cellSize * 2.9, cellSize * (row + 0.5));
      } else if (winPattern[0] % 3 == winPattern[1] % 3 &&
          winPattern[1] % 3 == winPattern[2] % 3) {
        // Vertical
        final col = winPattern[0] % 3;
        start = Offset(cellSize * (col + 0.5), cellSize * 0.1);
        end = Offset(cellSize * (col + 0.5), cellSize * 2.9);
      } else if (winPattern[0] == 0 &&
          winPattern[1] == 4 &&
          winPattern[2] == 8) {
        // Diagonal top-left to bottom-right
        start = Offset(cellSize * 0.1, cellSize * 0.1);
        end = Offset(cellSize * 2.9, cellSize * 2.9);
      } else if (winPattern[0] == 2 &&
          winPattern[1] == 4 &&
          winPattern[2] == 6) {
        // Diagonal top-right to bottom-left
        start = Offset(cellSize * 2.9, cellSize * 0.1);
        end = Offset(cellSize * 0.1, cellSize * 2.9);
      } else {
        return;
      }
      canvas.drawLine(start, end, winPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
