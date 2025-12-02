import 'package:flutter/material.dart';

/// Custom painter for a stylized Tic Tac Toe board.
///
/// Will basically draw the grid.
class TicTacToeBoardPainter extends CustomPainter {
  TicTacToeBoardPainter({
    this.strokeWidth = 6,
  });

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
