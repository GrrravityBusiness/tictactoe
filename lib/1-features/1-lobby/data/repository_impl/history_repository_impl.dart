import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/contestant_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ContestantImpl extends ContestantRepository {
  ContestantImpl({required ContestantSource contestantSource})
    : _contestantSource = contestantSource;

  final ContestantSource _contestantSource;

  @override
  Future<Either<Failure, bool>> clearOpponent() =>
      _contestantSource.clearOpponent();

  @override
  Either<Failure, Contestant> getMainContestant() {
    final contestantOrFailure = _contestantSource.getMainContestant();
    return contestantOrFailure.map(
      (contestant) => contestant.toEntity,
    );
  }

  @override
  Either<Failure, Contestant?> getOpponent() {
    final contestantOrFailure = _contestantSource.getOpponent();

    return contestantOrFailure.map(
      (contestant) => contestant?.toEntity,
    );
  }

  @override
  Future<Either<Failure, bool>> saveOpponent(Contestant contestant) =>
      _contestantSource.saveOpponent(contestant.toDTO);
}
