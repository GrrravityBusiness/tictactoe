import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';

part 'lobby_state.freezed.dart';

@freezed
abstract class LobbyData with _$LobbyData {
  const factory LobbyData({
    required MainContestant player,
    Opponent? opponent,
    @Default(<History>[]) List<History> history,
  }) = _LobbyData;
  const LobbyData._();
}
