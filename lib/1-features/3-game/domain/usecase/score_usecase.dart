import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/repositories/score_repository.dart';

class ScoreUsecase {
  ScoreUsecase({required ScoreRepository scoreRepository})
    : _scoreRepository = scoreRepository;

  final ScoreRepository _scoreRepository;

  /// Save final scores to local storage.
  /// If there are existing scores, it prepends the new score to the list.
  /// Returns true if the operation was successful, false otherwise.
  ///
  /// If something goes wrong during the operation, it handles the failure
  /// by deleting existing scores and saving only the new score.
  Future<bool> saveFinalScores(FinalScore finalScore) async {
    final savedScoresOrFailure = _scoreRepository.getFinalScores();

    if (savedScoresOrFailure.isLeft()) {
      await _scoreRepository.clearFinalScores();
      final result = await _scoreRepository.saveFinalScore([finalScore]);
      return result.fold(
        (failure) => false,
        (isSaved) => isSaved,
      );
    }

    final existingScores = savedScoresOrFailure.getOrElse(() => []);
    final finalScores = [finalScore, ...existingScores];

    final result = await _scoreRepository.saveFinalScore(finalScores);
    return result.fold(
      (failure) => false,
      (isSaved) => isSaved,
    );
  }
}
