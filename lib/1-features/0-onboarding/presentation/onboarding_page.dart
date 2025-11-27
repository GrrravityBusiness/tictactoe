import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/player_form.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/title_header.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/validate_onboarding_button.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/widgets/gradiant_scaffold.dart';
import 'package:tictactoe/core/widgets/snackbar.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PopScope(
      canPop: context.select<PlayerController, bool>(
        (controller) =>
            controller.state.isPlayerValid && controller.state.saved,
      ),
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        ShowSnackBar.showWarning(
          title: l10n.onboarding_prevent_close_title,
        );
      },
      child: GradientScaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const TitleHeader(),
                      const SizedBox(height: 32),
                      Text(l10n.onboarding_step_add_name),
                      const SizedBox(height: 8),
                      const PlayerForm(),
                      const SizedBox(height: 24),
                      const ValidateOnboardingButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
