import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_state.dart';

class ThemeController extends Cubit<ThemeState> {
  ThemeController()
    : super(
        const ThemeState(
          mode: ThemeMode.system,
          themeData: LightTheme(),
        ),
      );

  void toggleTheme() {
    if (state.mode == ThemeMode.light) {
      emit(state.copyWith(mode: ThemeMode.dark, themeData: const LightTheme()));
    } else {
      emit(
        state.copyWith(mode: ThemeMode.light, themeData: const DarkTheme()),
      );
    }
  }
}
