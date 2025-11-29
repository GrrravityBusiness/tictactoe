import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/contestant_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ContestantRepositoryImpl extends ContestantRepository {
  ContestantRepositoryImpl({required ContestantSource contestantSource})
    : _contestantSource = contestantSource;

  final ContestantSource _contestantSource;

  @override
  /// Gets the main contestant from the data source and
  /// converts it to entity objects
  Either<Failure, Contestant> getMainContestant() {
    final contestantOrFailure = _contestantSource.getMainContestant();
    return contestantOrFailure.map(
      (contestant) => contestant.toEntity,
    );
  }

  @override
  /// Saves the main contestant contestant in datasource
  Future<Either<Failure, bool>> saveMainContestant(Contestant contestant) =>
      _contestantSource.saveMainContestant(contestant.toDTO);

  @override
  /// Clears the saved main contestant from the data source
  Future<Either<Failure, bool>> clearMainContestant() =>
      _contestantSource.clearMainContestant();

  @override
  /// Gets the opponent from the data source and
  /// converts it to entity objects
  Either<Failure, Contestant?> getOpponent() {
    final contestantOrFailure = _contestantSource.getOpponent();

    return contestantOrFailure.map(
      (contestant) => contestant?.toEntity,
    );
  }

  @override
  /// Saves the opponent contestant in datasource
  Future<Either<Failure, bool>> saveOpponent(Contestant contestant) =>
      _contestantSource.saveOpponent(contestant.toDTO);

  @override
  /// Clears the saved opponent contestant from the data source
  Future<Either<Failure, bool>> clearOpponent() =>
      _contestantSource.clearOpponent();
}
