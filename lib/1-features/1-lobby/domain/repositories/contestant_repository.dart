import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class ContestantRepository {
  Either<Failure, Contestant> getMainContestant();
  Either<Failure, Contestant?> getOpponent();
  Future<Either<Failure, bool>> saveOpponent(Contestant contestant);
  Future<Either<Failure, bool>> clearOpponent();
}
