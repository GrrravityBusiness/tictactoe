import 'package:bloc/bloc.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';

class GameController extends Cubit<GameState> {
  GameController({
    required String player1,
    required String player2,
  }) : super(
         GameState(
           player1: Gamer(name: player1, remainingCounts: 4, wins: 0),
           player2: Gamer(name: player2, remainingCounts: 5, wins: 0),
           currentPlayer: 1,
           board: List.filled(9, -1),
         ),
       );

  bool makeMove(({int index, int value}) move) {
    final updatedBoard = List<int>.from(state.board);
    final currentValue = updatedBoard[move.index];
    if (currentValue != -1) {
      return false;
    }
    updatedBoard[move.index] = move.value;
    final nextPlayer = state.currentPlayer == 1 ? 2 : 1;
    if (move.value == 1) {
      final updatedPlayer1 = state.player1.copyWith(
        remainingCounts: state.player1.remainingCounts - 1,
      );
      emit(
        state.copyWith(
          player1: updatedPlayer1,
          board: updatedBoard,
          currentPlayer: nextPlayer,
        ),
      );
    } else {
      final updatedPlayer2 = state.player2.copyWith(
        remainingCounts: state.player2.remainingCounts - 1,
      );
      emit(
        state.copyWith(
          player2: updatedPlayer2,
          board: updatedBoard,
          currentPlayer: nextPlayer,
        ),
      );
    }
    return true;
  }

  void updateScores(int winnerPlayer) {
    if (winnerPlayer == 1) {
      final updatedScores = state.player1.copyWith(
        wins: state.player1.wins + 1,
      );
      emit(state.copyWith(player1: updatedScores));
    } else {
      final updatedScores = state.player2.copyWith(
        wins: state.player2.wins + 1,
      );
      emit(state.copyWith(player2: updatedScores));
    }
  }

  Future<void> saveScores() async {}
}
