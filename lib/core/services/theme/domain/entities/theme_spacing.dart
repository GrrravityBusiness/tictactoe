import 'dart:ui' as ui show lerpDouble;

import 'package:flutter/material.dart';

class ThemeSpacing extends ThemeExtension<ThemeSpacing> {
  const ThemeSpacing({
    this.small = 4,
    this.medium = 8,
    this.large = 16,
    this.xlarge = 24,
  });

  /// Default to 4.
  final double small;

  /// Default to 8.
  final double medium;

  /// Default to 16.
  final double large;

  /// Default to 24.
  final double xlarge;

  @override
  ThemeSpacing copyWith({
    double? small,
    double? medium,
    double? large,
    double? xlarge,
  }) {
    return ThemeSpacing(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
    );
  }

  @override
  ThemeExtension<ThemeSpacing> lerp(
    ThemeExtension<ThemeSpacing>? other,
    double t,
  ) {
    if (other is! ThemeSpacing) {
      return this;
    }

    return ThemeSpacing(
      small: ui.lerpDouble(small, other.small, t) ?? small,
      medium: ui.lerpDouble(medium, other.medium, t) ?? medium,
      large: ui.lerpDouble(large, other.large, t) ?? large,
      xlarge: ui.lerpDouble(xlarge, other.xlarge, t) ?? xlarge,
    );
  }
}
