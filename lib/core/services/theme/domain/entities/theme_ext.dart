import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_icon.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_radius.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_spacing.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_typography.dart';

class DSTokens extends ThemeExtension<DSTokens> {
  const DSTokens({
    required this.spacing,
    required this.radius,
    required this.icons,
    required this.typography,
  });

  final ThemeSpacing spacing;
  final ThemeRadius radius;
  final ThemeTypography typography;
  final ThemeIcon icons;
  @override
  ThemeExtension<DSTokens> copyWith({
    ThemeSpacing? spacing,
    ThemeRadius? radius,
    ThemeTypography? typography,
    ThemeIcon? icons,
  }) {
    return DSTokens(
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      typography: typography ?? this.typography,
      icons: icons ?? this.icons,
    );
  }

  @override
  ThemeExtension<DSTokens> lerp(
    covariant ThemeExtension<DSTokens>? other,
    double t,
  ) {
    return this;
  }
}

extension OnThemeExtensionDSTokens on BuildContext {
  DSTokens get dsTokens => Theme.of(this).extension<DSTokens>()!;
}
