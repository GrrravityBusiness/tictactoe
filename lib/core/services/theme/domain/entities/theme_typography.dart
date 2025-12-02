import 'package:flutter/material.dart';

class ThemeTypography extends TextStyle {
  const ThemeTypography({
    super.color,
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

  static const baseFontFamilly = 'Gluten';

  static const lightTheme = TextTheme(
    displayLarge: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color(0xFFD32F2F),
    ),
    displayMedium: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color(0xFFD32F2F),
    ),
    displaySmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Color(0xFFD32F2F),
    ),
    titleLarge: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Color(0xFFD32F2F),
    ),
    titleMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xFFD32F2F),
    ),
    titleSmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFD32F2F),
    ),
    headlineLarge: ThemeTypography(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFFD32F2F),
    ),
    headlineMedium: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFFD32F2F),
    ),
    headlineSmall: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFFD32F2F),
    ),
    labelLarge: ThemeTypography(
      fontWeight: FontWeight.w700,
      color: Color(0xFFD32F2F),
    ),
    labelMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFFD32F2F),
    ),
    labelSmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0xFFD32F2F),
    ),
    bodyMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFD32F2F),
    ),
    bodySmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFFD32F2F),
    ),
  );

  static const dartTheme = TextTheme(
    displayLarge: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color(0xFFF87171),
    ),
    displayMedium: ThemeTypography(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: Color(0xFFF87171),
    ),
    displaySmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Color(0xFFF87171),
    ),
    titleLarge: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Color(0xFFF87171),
    ),
    titleMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xFFF87171),
    ),
    titleSmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF87171),
    ),
    headlineLarge: ThemeTypography(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFFF87171),
    ),
    headlineMedium: ThemeTypography(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF87171),
    ),
    headlineSmall: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFFF87171),
    ),
    labelLarge: ThemeTypography(
      fontWeight: FontWeight.w700,
      color: Color(0xFFF87171),
    ),
    labelMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF87171),
    ),
    labelSmall: ThemeTypography(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0xFFF87171),
    ),
    bodyMedium: ThemeTypography(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFF87171),
    ),
    bodySmall: ThemeTypography(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFFF87171),
    ),
  );
}
