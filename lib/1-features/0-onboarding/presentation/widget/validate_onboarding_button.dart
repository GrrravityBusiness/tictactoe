import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/core/router/routes.dart';

class ValidateOnboardingButton extends StatelessWidget {
  const ValidateOnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerController, PlayerState>(
      builder: (context, state) {
        return TextButton(
          onPressed: state.player != null
              ? () async {
                  await context.read<PlayerController>().savePlayer();
                  if (context.mounted) {
                    context.go(AppRoutes.lobby);
                  }
                }
              : null,
          child: const Text('Go to Lobby'),
        );
      },
    );
  }
}
