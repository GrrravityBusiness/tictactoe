import 'package:flutter/material.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(
          l10n.onboarding_welcome_title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            shadows: [
              const Shadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Container(
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
                xColor: theme.colorScheme.primary,
                oColor: theme.colorScheme.tertiary,
              ),
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom painter for a stylized Tic Tac Toe board with X and O.
class _TicTacToeBoardPainter extends CustomPainter {
  _TicTacToeBoardPainter({
    required this.oColor,
    required this.xColor,
  });

  final Color oColor;
  final Color xColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final cellSize = size.width / 3;

    // Draw grid
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

    canvas
      ..drawLine(
        // X in top-left
        Offset(cellSize * 0.2, cellSize * 0.2),
        Offset(cellSize * 0.8, cellSize * 0.8),
        oPaint,
      )
      ..drawLine(
        Offset(cellSize * 0.8, cellSize * 0.2),
        Offset(cellSize * 0.2, cellSize * 0.8),
        oPaint,
      )
      ..drawCircle(
        // O in center
        Offset(cellSize * 1.5, cellSize * 1.5),
        cellSize * 0.35,
        xPaint,
      )
      ..drawLine(
        // X in bottom-right
        Offset(cellSize * 2 + cellSize * 0.2, cellSize * 2 + cellSize * 0.2),
        Offset(cellSize * 2 + cellSize * 0.8, cellSize * 2 + cellSize * 0.8),
        oPaint,
      )
      ..drawLine(
        Offset(cellSize * 2 + cellSize * 0.8, cellSize * 2 + cellSize * 0.2),
        Offset(cellSize * 2 + cellSize * 0.2, cellSize * 2 + cellSize * 0.8),
        oPaint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
