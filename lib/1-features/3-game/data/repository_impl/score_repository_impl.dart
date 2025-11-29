import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/3-game/data/datasource/score_datasource.dart';
import 'package:tictactoe/1-features/3-game/data/dto/final_score_dto.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/1-features/3-game/domain/repositories/score_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ScoreRepositoryImpl extends ScoreRepository {
  ScoreRepositoryImpl({required ScoreDatasource scoreDatasource})
    : _scoreDatasource = scoreDatasource;

  final ScoreDatasource _scoreDatasource;

  @override
  Future<Either<Failure, bool>> clearFinalScores() =>
      _scoreDatasource.clearScores();

  @override
  Either<Failure, List<FinalScore>> getFinalScores() {
    final scoresOrFailure = _scoreDatasource.getScores();
    return scoresOrFailure.map(
      (scoreDTOs) => scoreDTOs.toEntity,
    );
  }

  @override
  Future<Either<Failure, bool>> saveFinalScore(
    List<FinalScore> finalScores,
  ) async => _scoreDatasource.saveScore(
    finalScoreDTO: finalScores.toDTO,
  );
}
