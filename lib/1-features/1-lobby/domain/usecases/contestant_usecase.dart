import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ContestantUseCase {
  ContestantUseCase({required ContestantRepository contestantRepository})
    : _contestantRepository = contestantRepository;

  final ContestantRepository _contestantRepository;

  /// Gets the main contestant ensuring the type is [MainContestant]
  /// Otherwise returns a [Failure.badResponse]
  Either<Failure, MainContestant> getMainContestant() {
    final contestantOrFailure = _contestantRepository.getMainContestant();

    return contestantOrFailure.bind(
      (contestant) {
        // Handling expected type using if statement and runtime type check
        if (contestant is Opponent) {
          return const Left(Failure.badResponse());
        }
        return Right(contestant as MainContestant);
      },
    );
  }

  /// Gets the main contestant ensuring the type is [Opponent] or null
  /// If the type is [MainContestant] returns a [Failure.badResponse] instead
  Either<Failure, Opponent?> getOpponent() {
    final contestantOrFailure = _contestantRepository.getOpponent();

    return contestantOrFailure.bind(
      (contestant) {
        if (contestant == null) {
          return const Right(null);
        }
        // Handling expected type using freezed map utility
        return contestant.map(
          mainContestant: (mainContestant) => const Left(Failure.badResponse()),
          opponent: Right.new,
        );
      },
    );
  }

  /// Save the opponent contestant to keep it in memory
  Future<bool> saveOpponent(Contestant contestant) async {
    final result = await _contestantRepository.saveOpponent(contestant);
    return result.fold(
      (failure) => false,
      (isSaved) => isSaved,
    );
  }

  /// Clears the saved opponent contestant from storage
  Future<bool> clearOpponent() async {
    final result = await _contestantRepository.clearOpponent();
    return result.fold(
      (failure) => false,
      (isCleared) => isCleared,
    );
  }
}
