import 'package:flutter/material.dart';

class XorOAnimatedPaint extends StatelessWidget {
  const XorOAnimatedPaint({
    required this.xOrO,
    required this.strokeWidth,
    super.key,
  });

  final int xOrO;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Visibility(
      visible: xOrO != -1,

      maintainAnimation: true,
      maintainState: true,
      child: AnimatedRotation(
        turns: xOrO != -1 ? 0 : -0.06,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOutBack,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          curve: Curves.bounceIn,
          scale: xOrO != -1 ? 1 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 550),
            curve: Curves.bounceIn,
            opacity: xOrO != -1 ? 1 : 0,
            child: xOrO == -1
                ? const SizedBox.shrink()
                : xOrO == 1
                ? CustomPaint(
                    painter: XPainter(
                      color: theme.colorScheme.primary,
                      strokeWidth: strokeWidth,
                    ),
                  )
                : CustomPaint(
                    painter: OPainter(
                      color: Colors.blue,
                      strokeWidth: strokeWidth,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

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
      ..strokeCap = StrokeCap.round
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
      ..strokeCap = StrokeCap.round
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
