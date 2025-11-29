import 'package:flutter/material.dart';

/// Custom painter for drawing an X symbol.
class XPainter extends CustomPainter {
  XPainter({
    required this.color,
    this.strokeWidth = 7,
    this.paddingFraction = 0.22,
  });
  final Color color;
  final double strokeWidth;
  final double paddingFraction;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final padding = size.width * paddingFraction;
    final center = Offset(size.width / 2, size.height / 2);
    final half = size.width / 2;

    // Draw X
    canvas
      ..drawLine(
        Offset(center.dx - half + padding, center.dy - half + padding),
        Offset(center.dx + half - padding, center.dy + half - padding),
        paint,
      )
      ..drawLine(
        Offset(center.dx + half - padding, center.dy - half + padding),
        Offset(center.dx - half + padding, center.dy + half - padding),
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painter for drawing an O symbol.
class OPainter extends CustomPainter {
  OPainter({
    required this.color,
    this.strokeWidth = 7,
    this.paddingFraction = 0.22,
  });
  final Color color;
  final double strokeWidth;
  final double paddingFraction;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final padding = size.width * paddingFraction;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - padding;

    // Draw O
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
