import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer_score.dart';
import 'package:tictactoe/1-features/3-game/domain/repositories/score_repository.dart';
import 'package:tictactoe/1-features/3-game/domain/usecase/score_usecase.dart';
import 'package:tictactoe/core/utils/failures.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

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
  group('ScoreUsecase', () {
    late MockScoreRepository repository;
    late ScoreUsecase usecase;

    setUp(() {
      repository = MockScoreRepository();
      usecase = ScoreUsecase(scoreRepository: repository);
    });

    group('saveFinalScores', () {
      test('prepends new score if existing scores', () async {
        final newScore = makeScore();
        final existingScores = [
          makeScore(mainPlayerScore: 2, opponentScore: 3),
        ];

        when(
          () => repository.getFinalScores(),
        ).thenReturn(right(existingScores));
        when(
          () => repository.saveFinalScore([newScore, ...existingScores]),
        ).thenAnswer((_) async => right(true));

        final result = await usecase.saveFinalScores(newScore);

        expect(result, isTrue);

        verify(() => repository.getFinalScores()).called(1);
        verify(
          () => repository.saveFinalScore([newScore, ...existingScores]),
        ).called(1);
      });

      test(
        'clears and saves only new score on failure',
        () async {
          final newScore = makeScore();

          when(
            () => repository.getFinalScores(),
          ).thenReturn(left(const Failure.badRequest()));
          when(
            () => repository.clearFinalScores(),
          ).thenAnswer((_) async => right(true));
          when(
            () => repository.saveFinalScore([newScore]),
          ).thenAnswer((_) async => right(true));

          final result = await usecase.saveFinalScores(newScore);

          expect(result, isTrue);

          verify(() => repository.getFinalScores()).called(1);
          verify(() => repository.clearFinalScores()).called(1);
          verify(() => repository.saveFinalScore([newScore])).called(1);
        },
      );

      test('returns false if save fails after clear', () async {
        final newScore = makeScore();

        when(
          () => repository.getFinalScores(),
        ).thenReturn(left(const Failure.badRequest()));
        when(
          () => repository.clearFinalScores(),
        ).thenAnswer((_) async => right(true));
        when(
          () => repository.saveFinalScore([newScore]),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await usecase.saveFinalScores(newScore);

        expect(result, isFalse);

        verify(() => repository.getFinalScores()).called(1);
        verify(() => repository.clearFinalScores()).called(1);
        verify(() => repository.saveFinalScore([newScore])).called(1);
      });

      test(
        'returns false if save fails with existing scores',
        () async {
          final newScore = makeScore();
          final existingScores = [
            makeScore(mainPlayerScore: 2, opponentScore: 3),
          ];

          when(
            () => repository.getFinalScores(),
          ).thenReturn(right(existingScores));
          when(
            () => repository.saveFinalScore([newScore, ...existingScores]),
          ).thenAnswer((_) async => left(const Failure.badRequest()));

          final result = await usecase.saveFinalScores(newScore);

          expect(result, isFalse);

          verify(() => repository.getFinalScores()).called(1);
          verify(
            () => repository.saveFinalScore([newScore, ...existingScores]),
          ).called(1);
        },
      );
    });
  });
}
