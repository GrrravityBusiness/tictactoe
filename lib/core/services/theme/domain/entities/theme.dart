import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_color.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_icon.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_radius.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_spacing.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_typography.dart';

abstract class AppTheme {
  const AppTheme({
    required this.dsTokens,
    required this.colorScheme,
    required this.textTheme,
    required this.primaryTextTheme,
  });

  final DSTokens dsTokens;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final TextTheme primaryTextTheme;

  ThemeData get baseTheme;
}

class LightTheme extends AppTheme with AppThemeMixin {
  const LightTheme({
    super.dsTokens = const DSTokens(
      spacing: ThemeSpacing(),
      radius: ThemeRadius(),
      typography: ThemeTypography(),
      icons: ThemeIcon(),
    ),
    super.textTheme = ThemeTypography.lightTheme,
    super.primaryTextTheme = ThemeTypography.dartTheme,
    super.colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColor.primary,
      surfaceTint: LightThemeColor.surfaceTint,
      onPrimary: LightThemeColor.onPrimary,
      primaryContainer: LightThemeColor.primaryContainer,
      onPrimaryContainer: LightThemeColor.onPrimaryContainer,
      secondary: LightThemeColor.secondary,
      onSecondary: LightThemeColor.onSecondary,
      secondaryContainer: LightThemeColor.secondaryContainer,
      onSecondaryContainer: LightThemeColor.onSecondaryContainer,
      tertiary: LightThemeColor.tertiary,
      onTertiary: LightThemeColor.onTertiary,
      tertiaryContainer: LightThemeColor.tertiaryContainer,
      onTertiaryContainer: LightThemeColor.onTertiaryContainer,
      error: LightThemeColor.error,
      onError: LightThemeColor.onError,
      errorContainer: LightThemeColor.errorContainer,
      onErrorContainer: LightThemeColor.onErrorContainer,
      surface: LightThemeColor.surface,
      onSurface: LightThemeColor.onSurface,
      onSurfaceVariant: LightThemeColor.onSurfaceVariant,
      outline: LightThemeColor.outline,
      outlineVariant: LightThemeColor.outlineVariant,
      shadow: LightThemeColor.shadow,
      scrim: LightThemeColor.scrim,
      inverseSurface: LightThemeColor.inverseSurface,
      inversePrimary: LightThemeColor.inversePrimary,
      primaryFixed: LightThemeColor.primaryFixed,
      onPrimaryFixed: LightThemeColor.onPrimaryFixed,
      primaryFixedDim: LightThemeColor.primaryFixedDim,
      onPrimaryFixedVariant: LightThemeColor.onPrimaryFixedVariant,
      secondaryFixed: LightThemeColor.secondaryFixed,
      onSecondaryFixed: LightThemeColor.onSecondaryFixed,
      secondaryFixedDim: LightThemeColor.secondaryFixedDim,
      onSecondaryFixedVariant: LightThemeColor.onSecondaryFixedVariant,
      tertiaryFixed: LightThemeColor.tertiaryFixed,
      onTertiaryFixed: LightThemeColor.onTertiaryFixed,
      tertiaryFixedDim: LightThemeColor.tertiaryFixedDim,
      onTertiaryFixedVariant: LightThemeColor.onTertiaryFixedVariant,
      surfaceDim: LightThemeColor.surfaceDim,
      surfaceBright: LightThemeColor.surfaceBright,
      surfaceContainerLowest: LightThemeColor.surfaceContainerLowest,
      surfaceContainerLow: LightThemeColor.surfaceContainerLow,
      surfaceContainer: LightThemeColor.surfaceContainer,
      surfaceContainerHigh: LightThemeColor.surfaceContainerHigh,
      surfaceContainerHighest: LightThemeColor.surfaceContainerHighest,
    ),
  });
}

class DarkTheme extends AppTheme with AppThemeMixin {
  const DarkTheme({
    super.dsTokens = const DSTokens(
      spacing: ThemeSpacing(),
      radius: ThemeRadius(),
      typography: ThemeTypography(),
      icons: ThemeIcon(),
    ),
    super.textTheme = ThemeTypography.dartTheme,
    super.primaryTextTheme = ThemeTypography.lightTheme,
    super.colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: DarkThemeColor.primary,
      surfaceTint: DarkThemeColor.surfaceTint,
      onPrimary: DarkThemeColor.onPrimary,
      primaryContainer: DarkThemeColor.primaryContainer,
      onPrimaryContainer: DarkThemeColor.onPrimaryContainer,
      secondary: DarkThemeColor.secondary,
      onSecondary: DarkThemeColor.onSecondary,
      secondaryContainer: DarkThemeColor.secondaryContainer,
      onSecondaryContainer: DarkThemeColor.onSecondaryContainer,
      tertiary: DarkThemeColor.tertiary,
      onTertiary: DarkThemeColor.onTertiary,
      tertiaryContainer: DarkThemeColor.tertiaryContainer,
      onTertiaryContainer: DarkThemeColor.onTertiaryContainer,
      error: DarkThemeColor.error,
      onError: DarkThemeColor.onError,
      errorContainer: DarkThemeColor.errorContainer,
      onErrorContainer: DarkThemeColor.onErrorContainer,
      surface: DarkThemeColor.surface,
      onSurface: DarkThemeColor.onSurface,
      onSurfaceVariant: DarkThemeColor.onSurfaceVariant,
      outline: DarkThemeColor.outline,
      outlineVariant: DarkThemeColor.outlineVariant,
      shadow: DarkThemeColor.shadow,
      scrim: DarkThemeColor.scrim,
      inverseSurface: DarkThemeColor.inverseSurface,
      inversePrimary: DarkThemeColor.inversePrimary,
      primaryFixed: DarkThemeColor.primaryFixed,
      onPrimaryFixed: DarkThemeColor.onPrimaryFixed,
      primaryFixedDim: DarkThemeColor.primaryFixedDim,
      onPrimaryFixedVariant: DarkThemeColor.onPrimaryFixedVariant,
      secondaryFixed: DarkThemeColor.secondaryFixed,
      onSecondaryFixed: DarkThemeColor.onSecondaryFixed,
      secondaryFixedDim: DarkThemeColor.secondaryFixedDim,
      onSecondaryFixedVariant: DarkThemeColor.onSecondaryFixedVariant,
      tertiaryFixed: DarkThemeColor.tertiaryFixed,
      onTertiaryFixed: DarkThemeColor.onTertiaryFixed,
      tertiaryFixedDim: DarkThemeColor.tertiaryFixedDim,
      onTertiaryFixedVariant: DarkThemeColor.onTertiaryFixedVariant,
      surfaceDim: DarkThemeColor.surfaceDim,
      surfaceBright: DarkThemeColor.surfaceBright,
      surfaceContainerLowest: DarkThemeColor.surfaceContainerLowest,
      surfaceContainerLow: DarkThemeColor.surfaceContainerLow,
      surfaceContainer: DarkThemeColor.surfaceContainer,
      surfaceContainerHigh: DarkThemeColor.surfaceContainerHigh,
      surfaceContainerHighest: DarkThemeColor.surfaceContainerHighest,
    ),
  });
}

mixin AppThemeMixin on AppTheme {
  @override
  ThemeData get baseTheme => ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    fontFamily: ThemeTypography.baseFontFamilly,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    extensions: <ThemeExtension<dynamic>>[
      dsTokens,
    ],
  );
}
