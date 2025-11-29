import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class ScoreRepository {
  /// Clear all final scores from local storage.
  /// might throw [Failure] if something goes wrong during the operation
  Future<Either<Failure, bool>> clearFinalScores();

  /// Get final scores from local storage.
  /// might throw [Failure] if something goes wrong during the operation
  Either<Failure, List<FinalScore>> getFinalScores();

  /// Save final scores to local storage.
  /// might throw [Failure] if something goes wrong during the operation
  ///
  /// This will override any existing data, so make sure to retrieve existing
  /// data first, upsert it, then save it back.
  Future<Either<Failure, bool>> saveFinalScore(List<FinalScore> finalScores);
}
