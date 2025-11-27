import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/extra_action_footer.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/lobby_error.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/lobby_header.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/opponent_form_field.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/scoreboard_button.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/start_game_button.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/utils/async_value.dart';
import 'package:tictactoe/core/widgets/gradiant_scaffold.dart';
import 'package:tictactoe/core/widgets/loader.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // getting player name from PlayerController, for first initialization
    final playerName =
        context.read<PlayerController>().state.player?.name ?? '';
    return PopScope(
      canPop: false,
      child: GradientScaffold(
        body: BlocProvider<LobbyController>(
          create: (context) {
            return LobbyController(
              historyUseCase: getIt<HistoryUseCase>(),
              contestantUseCase: getIt<ContestantUseCase>(),
              playerName: playerName,
            );
          },
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ScoreboardButton(),
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: BlocListener<PlayerController, PlayerState>(
                    listener: (context, state) async {
                      if (state.saved && state.player != null) {
                        // Note: update lobby data when player is updated in
                        // onboarding we could also only update player name but
                        // for simplicity we re-initialize the lobby data
                        await context.read<LobbyController>().init(
                          playerName: state.player!.name,
                        );
                      }
                    },
                    // Note: listen to changes from onboarding feature to update
                    // Lobby controller, only when player is saved and different
                    // from before
                    listenWhen: (previous, current) => current.saved,
                    child: const _LobbyContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LobbyContent extends StatelessWidget {
  const _LobbyContent();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<LobbyController, AsyncValue<LobbyData, void>>(
      builder: (context, state) {
        return state.map(
          loaded: (loadedState) => Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  LobbyHeader(
                    playerName: loadedState.data.player.name,
                  ),
                  SizedBox(
                    height: context.dsTokens.spacing.large,
                  ),
                  Text(
                    l10n.lobby_select_opponent_title,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const OpponentFormField(),
                  SizedBox(
                    height: context.dsTokens.spacing.xlarge,
                  ),
                  const StartGameButton(),
                  SizedBox(
                    height: context.dsTokens.spacing.xlarge,
                  ),
                  const ExtraActionsFooter(),
                ],
              ),
            ),
          ),
          failure: (_) => const LobbyError(),
          loading: (_) => const Loader(),
        );
      },
    );
  }
}
