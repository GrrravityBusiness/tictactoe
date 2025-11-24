import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeMode mode,
    required AppTheme themeData,
  }) = _ThemeState;

  const ThemeState._();
}
