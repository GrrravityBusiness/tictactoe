import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_cubit.dart';
import 'package:tictactoe/core/services/theme/presentation/cubit/theme_state.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<ThemeController, ThemeState>(
      builder: (context, state) {
        final currentBrightness = state.themeData.baseTheme.brightness;
        return IconButton(
          onPressed: context.read<ThemeController>().toggleTheme,
          tooltip: l10n.theme_action_toggle,
          icon: Icon(
            currentBrightness == Brightness.light
                ? Icons.brightness_4
                : Icons.brightness_7,
            size: context.dsTokens.icons.medium,
          ),
        );
      },
    );
  }
}
