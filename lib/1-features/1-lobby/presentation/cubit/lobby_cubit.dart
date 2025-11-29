import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/core/utils/async_value.dart';
import 'package:tictactoe/core/utils/failures.dart';

class LobbyController extends Cubit<AsyncValue<LobbyData, void>> {
  LobbyController({
    required HistoryUseCase historyUseCase,
    required ContestantUseCase contestantUseCase,
    required String playerName,
  }) : _historyUseCase = historyUseCase,
       _contestantUseCase = contestantUseCase,
       super(
         playerName == ''
             ? AsyncValue.failure(failure: const Failure.elementNotFound())
             : AsyncValue.loading(),
       ) {
    unawaited(init(playerName: playerName));
  }

  final HistoryUseCase _historyUseCase;
  final ContestantUseCase _contestantUseCase;

  /// initialisation of the lobby data by retrieving main contestant,
  /// opponent and histories
  Future<void> init({required String playerName}) async {
    // Note: Faking async initialization
    if (!state.isLoaded) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    final mainContestantOrFailure = await _contestantUseCase.getMainContestant(
      playerName: playerName,
    );
    mainContestantOrFailure.fold(
      (failure) => emit(state.toFailure(failure)),
      (player) => emit(
        state.copyWithData(LobbyData(player: player)).asLoaded!,
      ),
    );
    _getOpponent();
    getHistories();
  }

  /// retrieve opponent from local storage and emit state update
  void _getOpponent() {
    final data = state.dataOrThrow;

    _contestantUseCase.getOpponent().fold(
      (failure) => emit(state.toFailure(failure)),
      (opponent) => emit(
        state.copyWithData(data.copyWith(opponent: opponent)).asLoaded!,
      ),
    );
  }

  /// retrieve histories from local storage and emit state update
  void getHistories() {
    final data = state.dataOrThrow;
    final history = _historyUseCase.getHistories();
    emit(
      state.copyWithData(data.copyWith(history: history)).asLoaded!,
    );
  }

  /// Save the current opponent into local storage, returns true on success.
  /// It will not save if the opponent is null or the name is empty.
  Future<bool> saveOpponent() async {
    final state = this.state.dataOrThrow;
    if (state.opponent == null || state.opponent!.name.isEmpty) {
      return false;
    }
    final result = await _contestantUseCase.saveOpponent(state.opponent!);
    return result;
  }

  /// Set current state with new opponent name and emit a change
  void setOpponent({required String name}) {
    final data = state.dataOrThrow;
    final player =
        data.opponent?.copyWith(name: name) ??
        Opponent(
          name: name,
          symbol: TicTacToeSymbols.X,
        );
    emit(state.copyWithData(data.copyWith(opponent: player)));
  }

  /// Delete the opponent from local storage, emits initial state on success.
  Future<bool> clearOpponent() async {
    final result = await _contestantUseCase.clearOpponent();
    if (result) {
      emit(
        state
            .copyWithData(
              state.dataOrThrow.copyWith(opponent: null),
            )
            .asLoaded!,
      );
    }
    return result;
  }
}
