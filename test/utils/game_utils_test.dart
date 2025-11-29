import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

void main() {
  group('GameUtils', () {
    group('getWinningPattern', () {
      test(
        'returns correct horizontal pattern for X win',
        () {
          final board = [1, 1, 1, -1, 0, 0, -1, -1, -1];
          expect(GameUtils.getWinningPattern(board, XorO.x.symbolValue), [
            0,
            1,
            2,
          ]);
        },
      );

      test('returns correct vertical pattern for O win', () {
        final board = [1, 0, 1, -1, 0, 1, -1, 0, -1];
        expect(GameUtils.getWinningPattern(board, XorO.o.symbolValue), [
          1,
          4,
          7,
        ]);
      });

      test('returns correct diagonal pattern for O win', () {
        final board = [0, 1, 1, -1, 0, 1, -1, -1, 0];
        expect(GameUtils.getWinningPattern(board, XorO.o.symbolValue), [
          0,
          4,
          8,
        ]);
      });

      test('returns null if no win', () {
        final board = [1, 0, 1, 0, 1, 0, 0, 1, 0];
        expect(GameUtils.getWinningPattern(board, XorO.x.symbolValue), isNull);
        expect(GameUtils.getWinningPattern(board, XorO.o.symbolValue), isNull);
      });
    });

    group('isBoardFull', () {
      test('isBoardFull returns true if board is full', () {
        final board = [1, 0, 1, 0, 1, 0, 0, 1, 0];
        expect(GameUtils.isBoardFull(board), isTrue);
      });

      test('isBoardFull returns false if board is not full', () {
        final board = [1, 0, 1, 0, -1, 0, 0, 1, 0];
        expect(GameUtils.isBoardFull(board), isFalse);
      });
    });

    group('hasWinner', () {
      test('returns true if there is a winner', () {
        final board = [1, 1, 1, 0, 0, -1, -1, -1, -1];
        expect(GameUtils.hasWinner(board), isTrue);
      });

      test('returns false if there is no winner', () {
        final board = [1, 0, 1, 0, 1, 0, 0, 1, 0];
        expect(GameUtils.hasWinner(board), isFalse);
      });
    });

    group('winningPlayer', () {
      test('returns 1 for X win', () {
        final board = [1, 1, 1, 0, 0, -1, -1, -1, -1];
        expect(GameUtils.winningPlayer(board), 1);
      });

      test('returns 0 for O win', () {
        final board = [0, 0, 0, 1, 1, -1, -1, -1, -1];
        expect(GameUtils.winningPlayer(board), 0);
      });

      test('returns -1 for no winner', () {
        final board = [1, 0, 1, 0, 1, 0, 0, 1, 0];
        expect(GameUtils.winningPlayer(board), -1);
      });
    });

    group('isDraw', () {
      test('returns true for draw', () {
        final board = [1, 0, 1, 0, 1, 0, 0, 1, 0];
        expect(GameUtils.isDraw(board), isTrue);
      });

      test('returns false if not draw', () {
        final board = [1, 1, 1, 0, 0, -1, -1, -1, -1];
        expect(GameUtils.isDraw(board), isFalse);
      });
    });
  });
}
