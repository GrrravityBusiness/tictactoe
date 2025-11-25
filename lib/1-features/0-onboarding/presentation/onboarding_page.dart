import 'package:flutter/material.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/player_form.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/validate_onboarding_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              PlayerForm(),
              ValidateOnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
