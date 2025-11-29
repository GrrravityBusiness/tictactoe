import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/history_repository.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/history_usecase.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

History makeHistory({int score = 1}) => History(
  playerScore: Score(
    contestant: const Contestant.mainContestant(
      name: 'Player1',
      symbol: TicTacToeSymbols.X,
    ),
    points: score,
  ),
  opponentScore: Score(
    contestant: const Contestant.opponent(
      name: 'Player2',
      symbol: TicTacToeSymbols.O,
    ),
    points: score + 1,
  ),
);

void main() {
  group('HistoryUseCase', () {
    late MockHistoryRepository repository;
    late HistoryUseCase usecase;

    setUp(() {
      repository = MockHistoryRepository();
      usecase = HistoryUseCase(historyRepository: repository);
    });

    group('clearHistories', () {
      test('returns true on success', () async {
        when(
          () => repository.clearHistories(),
        ).thenAnswer((_) async => const Right(true));

        final result = await usecase.clearHistories();

        expect(result, isTrue);

        verify(() => repository.clearHistories()).called(1);
      });

      test('returns false on failure', () async {
        when(
          () => repository.clearHistories(),
        ).thenAnswer((_) async => const Left(Failure.badRequest()));

        final result = await usecase.clearHistories();

        expect(result, isFalse);

        verify(() => repository.clearHistories()).called(1);
      });
    });
    group('getHistories', () {
      test('returns list on success', () {
        final histories = [makeHistory(), makeHistory(score: 2)];

        when(() => repository.getHistories()).thenReturn(Right(histories));

        final result = usecase.getHistories();

        expect(result.length, 2);
        expect(result.first.playerScore.points, 1);
        expect(result.last.playerScore.points, 2);

        verify(() => repository.getHistories()).called(1);
      });

      test('returns empty list on failure', () {
        when(
          () => repository.getHistories(),
        ).thenReturn(const Left(Failure.badRequest()));

        final result = usecase.getHistories();

        expect(result, isEmpty);

        verify(() => repository.getHistories()).called(1);
      });
    });
  });
}
