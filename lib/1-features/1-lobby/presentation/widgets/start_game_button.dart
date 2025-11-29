import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/utils/async_value.dart';
import 'package:tictactoe/core/widgets/buttons.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyController, AsyncValue<LobbyData, void>>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);
        return SimpleTextButton.primary(
          onPressed: state.data?.opponent != null
              ? () async {
                  await context.read<LobbyController>().saveOpponent();
                  if (context.mounted) {
                    context.goNamed(
                      AppRoutes.game,
                      queryParameters: {
                        'player1': state.dataOrThrow.player.name,
                        'player2': state.dataOrThrow.opponent!.name,
                      },
                    );
                  }
                }
              : null,
          text: l10n.lobby_start_game,
        );
      },
    );
  }
}
