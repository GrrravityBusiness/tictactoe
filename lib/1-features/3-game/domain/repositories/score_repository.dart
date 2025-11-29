import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class ScoreRepository {
  Future<Either<Failure, bool>> saveFinalScore(List<FinalScore> finalScores);
  Either<Failure, List<FinalScore>> getFinalScores();
  Future<Either<Failure, bool>> clearFinalScores();
}
