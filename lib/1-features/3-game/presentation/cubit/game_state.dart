import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/game_result.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required Gamer player1,
    required Gamer player2,
    required int currentPlayer,
    required List<int> board,
    GameResult? result,
  }) = _GameState;

  const GameState._();
}

extension OnGameState on GameState {
  bool get isDraw => result != null && result?.winnningPlayer == null;
  Gamer? get winner => result != null && result?.winnningPlayer != null
      ? (result!.winnningPlayer == 1 ? player1 : player2)
      : null;
}
