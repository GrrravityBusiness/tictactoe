import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class ContestantRepository {
  /// Gets the main contestant from the data source
  Either<Failure, Contestant> getMainContestant();

  /// Saves the main contestant in datasource
  Future<Either<Failure, bool>> saveMainContestant(Contestant contestant);

  /// Clears the saved main contestant from the data source
  Future<Either<Failure, bool>> clearMainContestant();

  /// Gets the opponent from the data source
  Either<Failure, Contestant?> getOpponent();

  /// Saves the opponent contestant in datasource
  Future<Either<Failure, bool>> saveOpponent(Contestant contestant);

  /// Clears the saved opponent contestant from the data source
  Future<Either<Failure, bool>> clearOpponent();
}
