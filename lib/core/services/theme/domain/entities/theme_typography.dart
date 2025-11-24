import 'package:flutter/material.dart';

class ThemeTypography extends TextStyle {
  const ThemeTypography({
    super.fontSize,
    super.fontWeight,
    super.inherit = true,
    super.backgroundColor,
    super.fontStyle,
    super.letterSpacing = 0,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.decoration = TextDecoration.none,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel = baseFontFamilly,
    super.overflow,
  }) : super(
         fontFamily: baseFontFamilly,
       );

  static const baseFontFamilly = 'Tilt Neon';

  static const textTheme = TextTheme(
    displayLarge: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: ThemeTypography(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: ThemeTypography(
      fontWeight: FontWeight.w700,
    ),
    labelMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
