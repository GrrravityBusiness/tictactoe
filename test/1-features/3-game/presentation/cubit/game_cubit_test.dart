import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/game_result.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer_score.dart';
import 'package:tictactoe/1-features/3-game/domain/usecase/score_usecase.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_cubit.dart';
import 'package:tictactoe/1-features/3-game/presentation/cubit/game_state.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

class MockScoreUsecase extends Mock implements ScoreUsecase {}

void main() {
  group('GameController (bloc_test)', () {
    late MockScoreUsecase mockScoreUsecase;
    late GameController cubit;
    const player1 = 'Alice';
    const player2 = 'Bob';

    setUp(() {
      mockScoreUsecase = MockScoreUsecase();
      cubit = GameController(
        player1: player1,
        player2: player2,
        scoreUsecase: mockScoreUsecase,
      );
    });

    group('makeMove', () {
      group('normal move', () {
        blocTest<GameController, GameState>(
          'emits updated board and switches player on valid move',
          build: () => cubit,
          act: (cubit) => cubit.makeMove((index: 0, value: XorO.x)),
          expect: () => [
            cubit.state.copyWith(
              board: [XorO.x.symbolValue, -1, -1, -1, -1, -1, -1, -1, -1],
              currentPlayer: 2,
            ),
          ],
        );

        blocTest<GameController, GameState>(
          'does not emit new state if cell is occupied',
          build: () {
            cubit.makeMove((index: 0, value: XorO.o));
            return cubit;
          },
          act: (cubit) => cubit.makeMove((index: 0, value: XorO.o)),
          expect: () => <GameState>[],
        );
      });
      group('Winning move', () {
        blocTest<GameController, GameState>(
          'emit winning state when a player wins horizontally',
          build: () {
            cubit
              ..makeMove((index: 0, value: XorO.x))
              ..makeMove((index: 3, value: XorO.o))
              ..makeMove((index: 1, value: XorO.x))
              ..makeMove((index: 4, value: XorO.o));
            return cubit;
          },
          act: (cubit) {
            return cubit.makeMove((index: 2, value: XorO.x));
          },
          expect: () => [
            cubit.state.copyWith(
              result: const GameResult(winnningPlayer: 1),
            ),
          ],
        );

        blocTest<GameController, GameState>(
          'emit winning state when a player wins vertically',
          build: () {
            cubit
              ..makeMove((index: 0, value: XorO.x))
              ..makeMove((index: 1, value: XorO.o))
              ..makeMove((index: 3, value: XorO.x))
              ..makeMove((index: 4, value: XorO.o))
              ..makeMove((index: 8, value: XorO.x));
            return cubit;
          },
          act: (cubit) {
            return cubit.makeMove((index: 7, value: XorO.o));
          },
          expect: () => [
            cubit.state.copyWith(
              result: const GameResult(winnningPlayer: 2),
            ),
          ],
        );

        blocTest<GameController, GameState>(
          'emit winning state when a player wins diagonally',
          build: () {
            cubit
              ..makeMove((index: 0, value: XorO.x))
              ..makeMove((index: 1, value: XorO.o))
              ..makeMove((index: 4, value: XorO.x))
              ..makeMove((index: 5, value: XorO.o));
            return cubit;
          },
          act: (cubit) {
            return cubit.makeMove((index: 8, value: XorO.x));
          },
          expect: () => [
            cubit.state.copyWith(
              result: const GameResult(winnningPlayer: 1),
            ),
          ],
        );
      });

      group('Draw move', () {
        blocTest<GameController, GameState>(
          'emit draw state when noone wins and board is full',
          build: () {
            cubit
              ..makeMove((index: 0, value: XorO.x))
              ..makeMove((index: 1, value: XorO.o))
              ..makeMove((index: 2, value: XorO.x))
              ..makeMove((index: 3, value: XorO.o))
              ..makeMove((index: 4, value: XorO.x))
              ..makeMove((index: 5, value: XorO.o))
              ..makeMove((index: 6, value: XorO.o))
              ..makeMove((index: 7, value: XorO.x));
            return cubit;
          },
          act: (cubit) {
            return cubit.makeMove((index: 8, value: XorO.o));
          },
          expect: () => [
            cubit.state.copyWith(
              result: const GameResult(),
            ),
          ],
        );
      });
    });

    group('nextGame', () {
      blocTest<GameController, GameState>(
        'resets board on nextGame',
        build: () {
          cubit
            ..makeMove((index: 0, value: XorO.x))
            ..makeMove((index: 1, value: XorO.o))
            ..makeMove((index: 2, value: XorO.x))
            ..makeMove((index: 3, value: XorO.o))
            ..makeMove((index: 4, value: XorO.x))
            ..makeMove((index: 5, value: XorO.o))
            ..makeMove((index: 6, value: XorO.o))
            ..makeMove((index: 7, value: XorO.x))
            ..makeMove((index: 8, value: XorO.o));
          return cubit;
        },
        act: (cubit) => cubit.nextGame(),
        expect: () => [
          cubit.state.copyWith(
            board: List.filled(9, -1),
          ),
        ],
      );

      blocTest<GameController, GameState>(
        'change 1st player on nextGame',
        build: () {
          cubit
            ..makeMove((index: 0, value: XorO.x))
            ..makeMove((index: 1, value: XorO.o))
            ..makeMove((index: 2, value: XorO.x))
            ..makeMove((index: 3, value: XorO.o))
            ..makeMove((index: 4, value: XorO.x))
            ..makeMove((index: 5, value: XorO.o))
            ..makeMove((index: 6, value: XorO.o))
            ..makeMove((index: 7, value: XorO.x))
            ..makeMove((index: 8, value: XorO.o));
          return cubit;
        },
        act: (cubit) => cubit.nextGame(),
        expect: () => [
          cubit.state.copyWith(currentPlayer: 2),
        ],
      );
    });

    group('saveScores', () {
      blocTest<GameController, GameState>(
        'calls saveScores and emits unchanged state',
        build: () {
          cubit
            ..makeMove((index: 0, value: XorO.x))
            ..makeMove((index: 1, value: XorO.o))
            ..makeMove((index: 3, value: XorO.x))
            ..makeMove((index: 4, value: XorO.o))
            ..makeMove((index: 2, value: XorO.x));
          // Build the expected FinalScore from the cubit state after moves
          final expectedScore = FinalScore(
            mainPlayerScore: GamerScore(
              points: cubit.state.player1.wins,
              gamer: GamerCmd(
                name: cubit.state.player1.name,
                symbol: cubit.state.player1.symbol,
              ),
            ),
            opponentScore: GamerScore(
              points: cubit.state.player2.wins,
              gamer: GamerCmd(
                name: cubit.state.player2.name,
                symbol: cubit.state.player2.symbol,
              ),
            ),
          );
          when(
            () => mockScoreUsecase.saveFinalScores(expectedScore),
          ).thenAnswer((_) => Future.value(true));
          return cubit;
        },
        act: (cubit) async => cubit.saveScores(),
        expect: () => <GameState>[],
        verify: (cubit) {
          final expectedScore = FinalScore(
            mainPlayerScore: GamerScore(
              points: cubit.state.player1.wins,
              gamer: GamerCmd(
                name: cubit.state.player1.name,
                symbol: cubit.state.player1.symbol,
              ),
            ),
            opponentScore: GamerScore(
              points: cubit.state.player2.wins,
              gamer: GamerCmd(
                name: cubit.state.player2.name,
                symbol: cubit.state.player2.symbol,
              ),
            ),
          );
          verify(
            () => mockScoreUsecase.saveFinalScores(expectedScore),
          ).called(1);
        },
      );
    });
  });
}
