import 'package:flutter/material.dart';

class TicTacToePainter extends StatelessWidget {
  const TicTacToePainter({
    this.board = const [1, -1, -1, -1, 0, -1, -1, -1, 1],
    super.key,
  }) : assert(board.length == 9, 'Board must have exactly 9 elements');

  final List<int> board;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.dark
                ? Colors.white12
                : Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: _TicTacToeBoardPainter(
            board: board,
            xColor: theme.colorScheme.primary,
            oColor: theme.colorScheme.tertiary,
            winLineColor: theme.colorScheme.error,
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
  });

  final List<int> board;

  final Color oColor;
  final Color xColor;
  final Color winLineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
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
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    // Draw some stylized O
    final oPaint = Paint()
      ..color = oColor
      ..strokeWidth = 7
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
        _paint0(
          canvas: canvas,
          center: center,
          cellSize: cellSize,
          padding: padding,
          paint: oPaint,
        );
      }
    }

    // Draw win line if any
    for (final winner in [1, 0]) {
      _drawWinLine(
        canvas: canvas,
        size: size,
        winner: winner,
        paint: winner == 1 ? xPaint : oPaint,
      );
    }
  }

  ({int x, int y}) _posFromIndex(int index) {
    final x = index % 3;
    final y = index ~/ 3;
    return (x: x, y: y);
  }

  void _paint0({
    required Canvas canvas,
    required Offset center,
    required double cellSize,
    required double padding,
    required Paint paint,
  }) {
    canvas.drawCircle(center, cellSize / 2 - padding, paint);
  }

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

  void _drawWinLine({
    required Canvas canvas,
    required Size size,
    required int winner,
    required Paint paint,
  }) {
    final cellSize = size.width / 3;
    final winPaint = paint
      ..strokeCap = StrokeCap.round
      ..color = winLineColor;

    // All possible win lines: (startCell, endCell)
    final winPatterns = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // Diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final pattern in winPatterns) {
      if (board[pattern[0]] == winner &&
          board[pattern[1]] == winner &&
          board[pattern[2]] == winner) {
        // Calculate start and end points for the line
        Offset start;
        Offset end;
        if (pattern[0] ~/ 3 == pattern[1] ~/ 3 &&
            pattern[1] ~/ 3 == pattern[2] ~/ 3) {
          // Horizontal
          final row = pattern[0] ~/ 3;
          start = Offset(cellSize * 0.1, cellSize * (row + 0.5));
          end = Offset(cellSize * 2.9, cellSize * (row + 0.5));
        } else if (pattern[0] % 3 == pattern[1] % 3 &&
            pattern[1] % 3 == pattern[2] % 3) {
          // Vertical
          final col = pattern[0] % 3;
          start = Offset(cellSize * (col + 0.5), cellSize * 0.1);
          end = Offset(cellSize * (col + 0.5), cellSize * 2.9);
        } else if (pattern[0] == 0 && pattern[1] == 4 && pattern[2] == 8) {
          // Diagonal top-left to bottom-right
          start = Offset(cellSize * 0.1, cellSize * 0.1);
          end = Offset(cellSize * 2.9, cellSize * 2.9);
        } else if (pattern[0] == 2 && pattern[1] == 4 && pattern[2] == 6) {
          // Diagonal top-right to bottom-left
          start = Offset(cellSize * 2.9, cellSize * 0.1);
          end = Offset(cellSize * 0.1, cellSize * 2.9);
        } else {
          continue;
        }
        canvas.drawLine(start, end, winPaint);
        break;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
