import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required Gamer player1,
    required Gamer player2,
    required int currentPlayer,
    required List<int> board,
  }) = _GameState;

  const GameState._();
}

@freezed
abstract class Gamer with _$Gamer {
  const factory Gamer({
    required String name,
    required int remainingCounts,
    required int wins,
  }) = _Gamer;

  const Gamer._();
}
