import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/scoreboard.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/utils/async_value.dart';

class ScoreboardButton extends StatelessWidget {
  const ScoreboardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<LobbyController, AsyncValue<LobbyData, void>>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async => showDialog(
            context: context,
            builder: (context) => ScoreBoardModal(
              histories: state.data?.history ?? [],
            ),
          ),
          icon: Icon(
            Icons.scoreboard_outlined,
            size: context.dsTokens.icons.xLarge,
            color: Colors.orange,
          ),
          tooltip: l10n.lobby_scoreboard_title,
        );
      },
    );
  }
}
