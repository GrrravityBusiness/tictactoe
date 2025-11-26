import 'package:flutter/material.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/player_form.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/title_header.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/widget/validate_onboarding_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onPrimary
                else
                  theme.colorScheme.primary,
                if (theme.brightness == Brightness.dark)
                  theme.colorScheme.onSecondary
                else
                  theme.colorScheme.onPrimary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TitleHeader(),
                  SizedBox(height: 32),
                  Text('Start by creating your player name'),
                  SizedBox(height: 8),
                  PlayerForm(),
                  SizedBox(height: 24),
                  ValidateOnboardingButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
