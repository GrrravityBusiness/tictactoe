import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_cubit.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_state.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeController, ThemeState>(
      builder: (context, state) {
        final currentBrightness = state.themeData.baseTheme.brightness;
        return TextButton.icon(
          onPressed: context.read<ThemeController>().toggleTheme,
          label: const Text('Toggle Theme'),
          icon: Icon(
            currentBrightness == Brightness.light
                ? Icons.brightness_4
                : Icons.brightness_7,
          ),
        );
      },
    );
  }
}
