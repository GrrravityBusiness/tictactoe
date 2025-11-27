import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/tictactoe_rules.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/widgets/buttons.dart';

class ExtraActionsFooter extends StatelessWidget {
  const ExtraActionsFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: .center,
      children: [
        SimpleTextButton.transparent(
          onPressed: () async => context.push(AppRoutes.onboarding),
          text: l10n.nav_go_to_onboarding,
        ),
        SimpleTextButton.transparent(
          onPressed: () async => showDialog(
            context: context,
            builder: (context) => const TicTacToeRulesModal(),
          ),
          text: l10n.lobby_see_rules,
        ),
      ],
    );
  }
}
