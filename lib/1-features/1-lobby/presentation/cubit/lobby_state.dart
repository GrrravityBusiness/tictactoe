import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';

part 'lobby_state.freezed.dart';

@freezed
abstract class LobbyState with _$LobbyState {
  const factory LobbyState({
    required MainContestant player,
    required Opponent opponent,
    required List<History> history,
  }) = _LobbyState;
  const LobbyState._();
}
