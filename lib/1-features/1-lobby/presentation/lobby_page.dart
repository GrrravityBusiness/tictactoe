import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/lobby_header.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/widgets/opponent_form_field.dart';
import 'package:tictactoe/core/localization/app_localizations.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/services/dependency_injection/dependency_injection.dart';
import 'package:tictactoe/core/services/theme/domain/entities/theme_ext.dart';
import 'package:tictactoe/core/services/theme/presentation/widget/theme_switcher.dart';
import 'package:tictactoe/core/utils/async_value.dart';
import 'package:tictactoe/core/widgets/buttons.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    // getting player name from PlayerController, for first initialization
    final playerName =
        context.read<PlayerController>().state.player?.name ?? '';
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: DecoratedBox(
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
          child: BlocProvider<LobbyController>(
            create: (context) {
              return LobbyController(
                historyUseCase: getIt<HistoryUseCase>(),
                contestantUseCase: getIt<ContestantUseCase>(),
                playerName: playerName,
              );
            },
            child: BlocListener<PlayerController, PlayerState>(
              listener: (context, state) async {
                if (state.saved && state.player != null) {
                  // Note: update lobby data when player is updated in onboarding
                  // we could also only update player name but for simplicity we
                  // re-initialize the lobby data
                  await context.read<LobbyController>().init(
                    playerName: state.player!.name,
                  );
                }
              },
              // Note: listen to changes from onboarding feature to update
              // Lobby controller, only when player is saved and different from
              // before
              listenWhen: (previous, current) =>
                  previous.player != current.player && current.saved,
              child: BlocBuilder<LobbyController, AsyncValue<LobbyData, void>>(
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
                            SizedBox(height: context.dsTokens.spacing.large),
                            Text(
                              l10n.lobby_select_opponent_title,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const OpponentFormField(),
                            const ThemeSwitcherWidget(),
                            SimpleTextButton.secondary(
                              onPressed: () async =>
                                  context.push(AppRoutes.onboarding),
                              text: l10n.nav_go_to_onboarding,
                            ),
                          ],
                        ),
                      ),
                    ),
                    failure: (_) => Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Column(
                          children: [
                            Text(l10n.lobby_page_error_message),
                          ],
                        ),
                      ),
                    ),
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
