import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/3-game/data/datasource/score_datasource.dart';
import 'package:tictactoe/1-features/3-game/data/dto/final_score_dto.dart';
import 'package:tictactoe/1-features/3-game/data/repository_impl/score_repository_impl.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer_score.dart';
import 'package:tictactoe/core/utils/failures.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

class MockScoreDatasource extends Mock implements ScoreDatasource {}

FinalScore makeScore({int? mainPlayerScore, int? opponentScore}) => FinalScore(
  mainPlayerScore: GamerScore(
    points: mainPlayerScore ?? 1,
    gamer: const GamerCmd(name: 'name', symbol: XorO.x),
  ),
  opponentScore: GamerScore(
    points: opponentScore ?? 1,
    gamer: const GamerCmd(name: 'name', symbol: XorO.x),
  ),
);

void main() {
  group('ScoreRepositoryImpl', () {
    late MockScoreDatasource datasource;
    late ScoreRepositoryImpl repository;

    setUp(() {
      datasource = MockScoreDatasource();
      repository = ScoreRepositoryImpl(scoreDatasource: datasource);
    });

    group('clearFinalScores', () {
      test('return true on success', () async {
        when(
          () => datasource.clearScores(),
        ).thenAnswer((_) async => right(true));

        final result = await repository.clearFinalScores();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => datasource.clearScores()).called(1);
      });
      test('returns Failure on error', () async {
        when(
          () => datasource.clearScores(),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.clearFinalScores();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('getFinalScores', () {
      test('return list of FinalScore on success', () {
        final scores = [
          makeScore(),
          makeScore(mainPlayerScore: 2, opponentScore: 3),
        ];

        when(
          () => datasource.getScores(),
        ).thenReturn(right(scores.map((e) => e.toDTO).toList()));

        final result = repository.getFinalScores();

        expect(result.isRight(), isTrue);

        final list = result.getOrElse(() => []);

        expect(list.length, 2);
        expect(list.first.mainPlayerScore.points, 1);
        expect(list.last.opponentScore.points, 3);

        verify(() => datasource.getScores()).called(1);
      });
      test('returns Failure on error', () {
        when(
          () => datasource.getScores(),
        ).thenReturn(left(const Failure.badRequest()));

        final result = repository.getFinalScores();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('saveFinalScore', () {
      test('return true on success', () async {
        final scores = [
          makeScore(),
          makeScore(mainPlayerScore: 2, opponentScore: 3),
        ];

        when(
          () =>
              datasource.saveScore(finalScoreDTO: any(named: 'finalScoreDTO')),
        ).thenAnswer((_) async => right(true));

        final result = await repository.saveFinalScore(scores);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(
          () =>
              datasource.saveScore(finalScoreDTO: any(named: 'finalScoreDTO')),
        ).called(1);
      });
      test('returns Failure on error', () async {
        final scores = [makeScore()];

        when(
          () =>
              datasource.saveScore(finalScoreDTO: any(named: 'finalScoreDTO')),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.saveFinalScore(scores);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
