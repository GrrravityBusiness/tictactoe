import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/repositories/score_repository.dart';

class ScoreUsecase {
  ScoreUsecase({required ScoreRepository scoreRepository})
    : _scoreRepository = scoreRepository;

  final ScoreRepository _scoreRepository;

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
