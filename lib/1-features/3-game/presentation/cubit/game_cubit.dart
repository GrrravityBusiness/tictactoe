import 'package:bloc/bloc.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/game_result.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

class GameController extends Cubit<GameState> {
  GameController({
    required String player1,
    required String player2,
  }) : super(
         GameState(
           player1: Gamer(
             name: player1,
             remainingCounts: 5,
             wins: 0,
             symbol: XorO.x,
           ),
           player2: Gamer(
             name: player2,
             remainingCounts: 4,
             wins: 0,
             symbol: XorO.o,
           ),
           currentPlayer: 1,
           board: List.filled(9, -1),
         ),
       );

  bool makeMove(({int index, XorO value}) move) {
    final updatedBoard = List<int>.from(state.board);
    final currentValue = updatedBoard[move.index];
    if (currentValue != -1) {
      // early return if cell is already occupied
      return false;
    }

    updatedBoard[move.index] = move.value.symbolValue;
    final nextPlayer = state.currentPlayer == 1 ? 2 : 1;

    final gameResult = _handleGameResult(
      board: updatedBoard,
      move: move,
    );

    emit(
      state.copyWith(
        board: updatedBoard,
        currentPlayer: nextPlayer,
        player1: _handleGamerUpdate(
          generateMain: true,
          isPlayer1Move: move.value == state.player1.symbol,
          result: gameResult,
        ),
        player2: _handleGamerUpdate(
          generateMain: false,
          isPlayer1Move: move.value == state.player2.symbol,
          result: gameResult,
        ),
        result: gameResult,
      ),
    );

    return true;
  }

  GameResult? _handleGameResult({
    required List<int> board,
    required ({int index, XorO value}) move,
  }) {
    GameResult? result;
    if (GameUtils.hasWinner(board)) {
      result = GameResult(winnningPlayer: move.value == XorO.x ? 1 : 2);
    }
    if (GameUtils.isDraw(board)) {
      result = const GameResult();
    }
    return result;
  }

  Gamer _handleGamerUpdate({
    required bool generateMain,
    required bool isPlayer1Move,
    required GameResult? result,
  }) {
    switch (generateMain) {
      case true:
        return isPlayer1Move
            ? state.player1.copyWith(
                remainingCounts: state.player1.remainingCounts > 0
                    ? state.player1.remainingCounts - 1
                    : 0,
                wins: result != null && result.winnningPlayer == 1
                    ? state.player1.wins + 1
                    : state.player1.wins,
              )
            : state.player1;
      case false:
        return isPlayer1Move
            ? state.player2
            : state.player2.copyWith(
                remainingCounts: state.player2.remainingCounts > 0
                    ? state.player2.remainingCounts - 1
                    : 0,
                wins: result != null && result.winnningPlayer == 2
                    ? state.player2.wins + 1
                    : state.player2.wins,
              );
    }
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

  void nextGame() {
    final player1NewSymbol = state.player1.symbol == XorO.x ? XorO.o : XorO.x;
    final player2NewSymbol = state.player2.symbol == XorO.x ? XorO.o : XorO.x;
    emit(
      state.copyWith(
        board: List.filled(9, -1),
        currentPlayer: player1NewSymbol == XorO.x ? 1 : 2,
        player1: Gamer(
          name: state.player1.name,
          remainingCounts: player1NewSymbol == XorO.x ? 5 : 4,
          wins: state.player1.wins,
          symbol: player1NewSymbol,
        ),
        player2: Gamer(
          name: state.player2.name,
          remainingCounts: player2NewSymbol == XorO.x ? 5 : 4,
          wins: state.player2.wins,
          symbol: player2NewSymbol,
        ),
        result: null,
      ),
    );
  }

  Future<void> saveScores() async {}
}
