import 'package:flutter/material.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

class TicTacToePainter extends StatelessWidget {
  const TicTacToePainter({
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
          painter: _TicTacToeBoardPainter(
            board: board,
            xColor: theme.colorScheme.primary,
            oColor: Colors.blue,
            winLineColor: theme.colorScheme.error,
            strokeWidth: strokeWidth,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

/// Custom painter for a stylized Tic Tac Toe board with X and O.
class _TicTacToeBoardPainter extends CustomPainter {
  _TicTacToeBoardPainter({
    required this.board,
    required this.oColor,
    required this.xColor,
    required this.winLineColor,
    this.strokeWidth = 6,
  });

  final List<int> board;

  final Color oColor;
  final Color xColor;
  final Color winLineColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final cellSize = size.width / 3;

    // Draw grid
    _paintGrid(
      canvas: canvas,
      cellSize: cellSize,
      size: size,
      paint: gridPaint,
    );

    // Draw some stylized X
    final xPaint = Paint()
      ..color = xColor
      ..strokeWidth = strokeWidth + 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw some stylized O
    final oPaint = Paint()
      ..color = oColor
      ..strokeWidth = 1 + strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < board.length; i++) {
      final element = board[i];
      final pos = _posFromIndex(i);
      final center = Offset(
        cellSize * (pos.x + 0.5),
        cellSize * (pos.y + 0.5),
      );
      final padding = cellSize * 0.22;
      if (element == 1) {
        // Draw X centered in cell
        _paintX(
          canvas: canvas,
          center: center,
          cellSize: cellSize,
          padding: padding,
          paint: xPaint,
        );
      }
      if (element == 0) {
        // Draw O centered in cell
        _paintO(
          canvas: canvas,
          center: center,
          cellSize: cellSize,
          padding: padding,
          paint: oPaint,
        );
      }
    }

    // Draw win line if any
    for (final winningCandidate in XorO.values) {
      _drawWinLine(
        canvas: canvas,
        size: size,
        winningValue: winningCandidate.symbolValue,
        paint: winningCandidate == XorO.x ? xPaint : oPaint,
      );
    }
  }

  /// Converts a board index (0-8) to (x,y) coordinates.
  ({int x, int y}) _posFromIndex(int index) {
    final x = index % 3;
    final y = index ~/ 3;
    return (x: x, y: y);
  }

  /// Draws a stylized O centered in a cell.
  void _paintO({
    required Canvas canvas,
    required Offset center,
    required double cellSize,
    required double padding,
    required Paint paint,
  }) {
    canvas.drawCircle(center, cellSize / 2 - padding, paint);
  }

  /// Draws a stylized X centered in a cell.
  void _paintX({
    required Canvas canvas,
    required Offset center,
    required double cellSize,
    required double padding,
    required Paint paint,
  }) {
    canvas
      ..drawLine(
        Offset(
          center.dx - cellSize / 2 + padding,
          center.dy - cellSize / 2 + padding,
        ),
        Offset(
          center.dx + cellSize / 2 - padding,
          center.dy + cellSize / 2 - padding,
        ),
        paint,
      )
      ..drawLine(
        Offset(
          center.dx + cellSize / 2 - padding,
          center.dy - cellSize / 2 + padding,
        ),
        Offset(
          center.dx - cellSize / 2 + padding,
          center.dy + cellSize / 2 - padding,
        ),
        paint,
      );
  }

  /// Draws the Tic Tac Toe grid.
  void _paintGrid({
    required Canvas canvas,
    required double cellSize,
    required Size size,
    required Paint paint,
  }) {
    for (var i = 1; i < 3; i++) {
      canvas
        ..drawLine(
          // Vertical lines
          Offset(cellSize * i, 0),
          Offset(cellSize * i, size.height),
          paint,
        )
        ..drawLine(
          // Horizontal lines
          Offset(0, cellSize * i),
          Offset(size.width, cellSize * i),
          paint,
        );
    }
  }

  /// Draws a line over the winning pattern where applicable.
  void _drawWinLine({
    required Canvas canvas,
    required Size size,
    required int winningValue,
    required Paint paint,
  }) {
    final cellSize = size.width / 3;
    final winPaint = paint
      ..strokeCap = StrokeCap.round
      ..color = winLineColor;

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
