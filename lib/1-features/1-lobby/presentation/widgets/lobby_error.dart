import 'package:flutter/material.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';

class LobbyError extends StatelessWidget {
  const LobbyError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Text(l10n.lobby_page_error_message),
          ],
        ),
      ),
    );
  }
}
