import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/history_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/history_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/score_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/repository_impl/history_repository_impl.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockHistorySource extends Mock implements HistorySource {}

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
  group('HistoryRepositoryImpl', () {
    late MockHistorySource source;
    late HistoryRepositoryImpl repository;

    setUp(() {
      source = MockHistorySource();
      repository = HistoryRepositoryImpl(historySource: source);
    });

    group('clearHistories', () {
      test('returns true on success', () async {
        when(
          () => source.clearHistories(),
        ).thenAnswer((_) async => right(true));

        final result = await repository.clearHistories();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => source.clearHistories()).called(1);
      });

      test('returns Failure on error', () async {
        when(
          () => source.clearHistories(),
        ).thenAnswer(
          (_) async => left(const Failure.badRequest()),
        );

        final result = await repository.clearHistories();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('getHistories', () {
      test('returns list of histories on success', () {
        final histories = [makeHistory(), makeHistory(score: 2)];

        when(
          () => source.getHistories(),
        ).thenReturn(
          right(
            histories
                .map(
                  (e) => HistoryDTO(
                    playerScore: ScoreDTO(
                      contestant: ContestantDTO(
                        name: e.playerScore.contestant.name,
                        symbol: e.playerScore.contestant.symbol.toDTO,
                        isMainContestant:
                            e.playerScore.contestant is MainContestant,
                      ),
                      points: e.playerScore.points,
                    ),
                    opponentScore: ScoreDTO(
                      contestant: ContestantDTO(
                        name: e.opponentScore.contestant.name,
                        symbol: e.opponentScore.contestant.symbol.toDTO,
                        isMainContestant:
                            e.opponentScore.contestant is MainContestant,
                      ),
                      points: e.opponentScore.points,
                    ),
                  ),
                )
                .toList(),
          ),
        );

        final result = repository.getHistories();

        expect(result.isRight(), isTrue);

        final list = result.getOrElse(() => []);

        expect(list.length, 2);
        expect(list.first.playerScore.points, 1);
        expect(list.last.playerScore.points, 2);

        verify(() => source.getHistories()).called(1);
      });

      test('returns Failure on error', () {
        when(
          () => source.getHistories(),
        ).thenReturn(
          left(const Failure.badRequest()),
        );

        final result = repository.getHistories();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
