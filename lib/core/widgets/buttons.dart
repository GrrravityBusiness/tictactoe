import 'package:flutter/material.dart';

enum SimpleTextButtonStyle { primary, secondary, danger, transparent }

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

  factory SimpleTextButton.transparent({
    required String text,
    required VoidCallback? onPressed,
  }) => SimpleTextButton(
    text: text,
    onPressed: onPressed,
    style: SimpleTextButtonStyle
        .transparent, // You may want to add a new style for transparent
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
    final theme = Theme.of(context);
    switch (style) {
      case SimpleTextButtonStyle.primary:
        return TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(18),
            ),
          ),
          minimumSize: const Size(50, 40),
          foregroundColor: isEnabled
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? theme.colorScheme.onTertiaryContainer
              : theme.colorScheme.onTertiaryContainer.withValues(alpha: 0.2),
        );
      case SimpleTextButtonStyle.secondary:
        return TextButton.styleFrom(
          minimumSize: const Size(50, 40),
          foregroundColor: isEnabled
              ? theme.primaryColor
              : theme.primaryColor.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          side: BorderSide(color: theme.primaryColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(18),
            ),
          ),
        );
      case SimpleTextButtonStyle.danger:
        return TextButton.styleFrom(
          minimumSize: const Size(50, 40),
          foregroundColor: isEnabled
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          backgroundColor: isEnabled
              ? Colors.red
              : Colors.red.withValues(alpha: 0.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(18),
            ),
          ),
        );
      case SimpleTextButtonStyle.transparent:
        return TextButton.styleFrom(
          foregroundColor: isEnabled
              ? theme.colorScheme.secondary
              : theme.colorScheme.secondary.withValues(alpha: 0.5),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
