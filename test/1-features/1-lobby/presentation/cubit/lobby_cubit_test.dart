import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_cubit.dart';
import 'package:tictactoe/1-features/1-lobby/presentation/cubit/lobby_state.dart';
import 'package:tictactoe/core/utils/async_value.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockContestantUseCase extends Mock implements ContestantUseCase {}

class MockHistoryUseCase extends Mock implements HistoryUseCase {}

void main() {
  group('LobbyController (bloc_test)', () {
    late MockContestantUseCase mockContestantUseCase;
    late MockHistoryUseCase mockHistoryUseCase;
    late LobbyController cubit;
    const playerName = 'Alice';
    const mainContestant = MainContestant(
      name: playerName,
      symbol: TicTacToeSymbols.X,
    );
    const opponent = Opponent(name: 'Bob', symbol: TicTacToeSymbols.O);
    const histories = <History>[
      History(
        playerScore: Score(contestant: mainContestant, points: 1),
        opponentScore: Score(contestant: opponent, points: 0),
      ),
    ];

    setUp(() {
      mockContestantUseCase = MockContestantUseCase();
      mockHistoryUseCase = MockHistoryUseCase();
      cubit = LobbyController(
        historyUseCase: mockHistoryUseCase,
        contestantUseCase: mockContestantUseCase,
        playerName: playerName,
      );
    });

    group('init', () {
      group('main Contestant', () {
        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits loaded state with main contestant',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: playerName,
              ),
            ).thenAnswer((_) async => const Right(mainContestant));
            when(
              () => mockContestantUseCase.getOpponent(),
            ).thenReturn(const Right(opponent));
            when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
            return cubit;
          },
          act: (_) async =>
              // Constructor calls init, so we just wait for it to be initiated.
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [
            AsyncValueLoaded<LobbyData, void>(
              data: const LobbyData(player: mainContestant),
            ),
            isA<AsyncValueLoaded<LobbyData, void>>(),
            isA<AsyncValueLoaded<LobbyData, void>>(),
          ],
        );

        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits failure state if main contestant not found',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: any(named: 'playerName'),
              ),
            ).thenAnswer((_) async => const Left(Failure.elementNotFound()));
            return cubit;
          },
          act: (cubit) async =>
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [isA<AsyncValueError<LobbyData, void>>()],
        );
      });

      group('Opponent', () {
        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits loaded state with opponent',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: playerName,
              ),
            ).thenAnswer((_) async => const Right(mainContestant));
            when(
              () => mockContestantUseCase.getOpponent(),
            ).thenReturn(const Right(opponent));
            when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
            return cubit;
          },
          act: (_) async =>
              // Constructor calls init, so we just wait for it to be initiated.
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [
            isA<AsyncValueLoaded<LobbyData, void>>(),
            AsyncValueLoaded<LobbyData, void>(
              data: const LobbyData(
                player: mainContestant,
                opponent: opponent,
              ),
            ),
            isA<AsyncValueLoaded<LobbyData, void>>(),
          ],
        );

        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits loaded state without opponent',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: playerName,
              ),
            ).thenAnswer((_) async => const Right(mainContestant));
            when(
              () => mockContestantUseCase.getOpponent(),
            ).thenReturn(const Right(null));
            when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
            return cubit;
          },
          act: (_) async =>
              // Constructor calls init, so we just wait for it to be initiated.
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [
            isA<AsyncValueLoaded<LobbyData, void>>(),
            AsyncValueLoaded<LobbyData, void>(
              data: const LobbyData(
                player: mainContestant,
                //Ignore for testing clarity purposes
                // ignore: avoid_redundant_argument_values
                opponent: null,
                history: histories,
              ),
            ),
          ],
        );
      });

      group('History', () {
        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits loaded state with history',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: playerName,
              ),
            ).thenAnswer((_) async => const Right(mainContestant));
            when(
              () => mockContestantUseCase.getOpponent(),
            ).thenReturn(const Right(opponent));
            when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
            return cubit;
          },
          act: (_) async =>
              // Constructor calls init, so we just wait for it to be initiated.
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [
            isA<AsyncValueLoaded<LobbyData, void>>(),
            isA<AsyncValueLoaded<LobbyData, void>>(),
            AsyncValueLoaded<LobbyData, void>(
              data: cubit.state.dataOrThrow.copyWith(
                history: histories,
              ),
            ),
          ],
        );

        blocTest<LobbyController, AsyncValue<LobbyData, void>>(
          'emits loaded state with empty history',
          build: () {
            when(
              () => mockContestantUseCase.getMainContestant(
                playerName: playerName,
              ),
            ).thenAnswer((_) async => const Right(mainContestant));
            when(
              () => mockContestantUseCase.getOpponent(),
            ).thenReturn(const Right(opponent));
            when(() => mockHistoryUseCase.getHistories()).thenReturn([]);
            return cubit;
          },
          act: (_) async =>
              // Constructor calls init, so we just wait for it to be initiated.
              Future<void>.delayed(const Duration(milliseconds: 600)),
          expect: () => [
            isA<AsyncValueLoaded<LobbyData, void>>(),
            AsyncValueLoaded<LobbyData, void>(
              data: cubit.state.dataOrThrow.copyWith(
                history: [],
              ),
            ),
          ],
        );
      });
    });

    group('setOpponent', () {
      blocTest<LobbyController, AsyncValue<LobbyData, void>>(
        'sets opponent with valid name',
        build: () {
          when(
            () => mockContestantUseCase.getMainContestant(
              playerName: playerName,
            ),
          ).thenAnswer((_) async => const Right(mainContestant));
          when(
            () => mockContestantUseCase.getOpponent(),
          ).thenReturn(const Right(null));
          when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
          return cubit;
        },
        act: (cubit) async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
          cubit.setOpponent(name: opponent.name);
        },
        expect: () => [
          isA<AsyncValueLoaded<LobbyData, void>>(),
          isA<AsyncValueLoaded<LobbyData, void>>(),
          AsyncValueLoaded<LobbyData, void>(
            data: cubit.state.dataOrThrow.copyWith(
              opponent: opponent,
            ),
          ),
        ],
      );

      blocTest<LobbyController, AsyncValue<LobbyData, void>>(
        'Set opponent with empty name',
        build: () {
          when(
            () => mockContestantUseCase.getMainContestant(
              playerName: playerName,
            ),
          ).thenAnswer((_) async => const Right(mainContestant));
          when(
            () => mockContestantUseCase.getOpponent(),
          ).thenReturn(const Right(opponent));
          when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
          return cubit;
        },
        act: (cubit) async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
          cubit.setOpponent(name: '');
        },
        expect: () => [
          isA<AsyncValueLoaded<LobbyData, void>>(),
          isA<AsyncValueLoaded<LobbyData, void>>(),
          isA<AsyncValueLoaded<LobbyData, void>>(),
          AsyncValueLoaded<LobbyData, void>(
            data: cubit.state.dataOrThrow.copyWith(
              opponent: cubit.state.dataOrThrow.opponent!.copyWith(name: ''),
            ),
          ),
        ],
      );
    });

    group('clearOpponent', () {
      blocTest<LobbyController, AsyncValue<LobbyData, void>>(
        'clears opponent from state',
        build: () {
          when(
            () => mockContestantUseCase.getMainContestant(
              playerName: playerName,
            ),
          ).thenAnswer((_) async => const Right(mainContestant));
          when(
            () => mockContestantUseCase.getOpponent(),
          ).thenReturn(const Right(opponent));
          when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
          when(
            () => mockContestantUseCase.clearOpponent(),
          ).thenAnswer((_) async => true);
          return cubit;
        },
        act: (cubit) async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
          await cubit.clearOpponent();
        },
        expect: () => [
          isA<AsyncValueLoaded<LobbyData, void>>(),
          isA<AsyncValueLoaded<LobbyData, void>>(),
          isA<AsyncValueLoaded<LobbyData, void>>(),
          AsyncValueLoaded<LobbyData, void>(
            data: LobbyData(
              player: cubit.state.dataOrThrow.player,
              // ignore for testing clarity purposes
              // ignore: avoid_redundant_argument_values
              opponent: null,
              history: cubit.state.dataOrThrow.history,
            ),
          ),
        ],
      );
    });

    group('saveOpponent', () {
      blocTest<LobbyController, AsyncValue<LobbyData, void>>(
        'successfully saves opponent',
        build: () {
          when(
            () => mockContestantUseCase.getMainContestant(
              playerName: playerName,
            ),
          ).thenAnswer((_) async => const Right(mainContestant));
          when(
            () => mockContestantUseCase.getOpponent(),
          ).thenReturn(const Right(null));
          when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
          when(
            () => mockContestantUseCase.saveOpponent(opponent),
          ).thenAnswer((_) async => true);
          return cubit;
        },
        act: (cubit) async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
          cubit.setOpponent(name: opponent.name);
          await cubit.saveOpponent();
        },
        verify: (bloc) => verify(
          () => mockContestantUseCase.saveOpponent(opponent),
        ).called(1),
      );

      blocTest<LobbyController, AsyncValue<LobbyData, void>>(
        'does not save opponent if null',
        build: () {
          when(
            () => mockContestantUseCase.getMainContestant(
              playerName: playerName,
            ),
          ).thenAnswer((_) async => const Right(mainContestant));
          when(
            () => mockContestantUseCase.getOpponent(),
          ).thenReturn(const Right(null));
          when(() => mockHistoryUseCase.getHistories()).thenReturn(histories);
          return cubit;
        },
        act: (cubit) async {
          await Future<void>.delayed(const Duration(milliseconds: 600));
          await cubit.saveOpponent();
        },
        verify: (bloc) => verifyNever(
          () => mockContestantUseCase.saveOpponent(opponent),
        ),
      );
    });
  });
}
