import 'package:flutter/material.dart';

enum SimpleTextButtonStyle { primary, secondary, danger }

class SimpleTextButton extends StatelessWidget {
  const SimpleTextButton({
    required this.text,
    required this.onPressed,
    this.style = SimpleTextButtonStyle.primary,
    super.key,
  });

  factory SimpleTextButton.primary({
    required String text,
    required VoidCallback? onPressed,
  }) => SimpleTextButton(
    text: text,
    onPressed: onPressed,
  );

  factory SimpleTextButton.secondary({
    required String text,
    required VoidCallback? onPressed,
  }) => SimpleTextButton(
    text: text,
    onPressed: onPressed,
    style: SimpleTextButtonStyle.secondary,
  );

  factory SimpleTextButton.danger({
    required String text,
    required VoidCallback? onPressed,
  }) => SimpleTextButton(
    text: text,
    onPressed: onPressed,
    style: SimpleTextButtonStyle.danger,
  );
  final String text;
  final VoidCallback? onPressed;
  final SimpleTextButtonStyle style;

  ButtonStyle _getButtonStyle(BuildContext context) {
    final isEnabled = onPressed != null;
    switch (style) {
      case SimpleTextButtonStyle.primary:
        return TextButton.styleFrom(
          foregroundColor: isEnabled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withValues(alpha: 0.5),
        );
      case SimpleTextButtonStyle.secondary:
        return TextButton.styleFrom(
          foregroundColor: isEnabled
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          side: BorderSide(color: Theme.of(context).primaryColor),
        );
      case SimpleTextButtonStyle.danger:
        return TextButton.styleFrom(
          foregroundColor: isEnabled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? Colors.red
              : Colors.red.withValues(alpha: 0.5),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _getButtonStyle(context),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
