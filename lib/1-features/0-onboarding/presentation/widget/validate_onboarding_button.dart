import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/widgets/buttons.dart';

class ValidateOnboardingButton extends StatelessWidget {
  const ValidateOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerController, PlayerState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);
        return SimpleTextButton.primary(
          onPressed: state.player != null && state.player!.name.isNotEmpty
              ? () async {
                  await context.read<PlayerController>().savePlayer();
                  if (context.mounted) {
                    context.go(AppRoutes.lobby);
                  }
                }
              : null,
          text: l10n.onboarding_action_validate_name,
        );
      },
    );
  }
}
