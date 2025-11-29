import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ContestantUseCase {
  ContestantUseCase({required ContestantRepository contestantRepository})
    : _contestantRepository = contestantRepository;

  final ContestantRepository _contestantRepository;

  /// Gets the main contestant ensuring the type is [MainContestant]
  /// If the type is [Opponent] or the name doesn't match the
  /// provided [playerName], a new [MainContestant] is created,
  /// saved and returned.
  /// Otherwise returns a [Failure.badResponse]
  Future<Either<Failure, MainContestant>> getMainContestant({
    required String playerName,
  }) {
    final contestantOrFailure = _contestantRepository.getMainContestant();

    return contestantOrFailure.fold(
      (failure) async {
        if (failure is FailureNotFound) {
          /// If no contestant is found, we create a new MainContestant,
          /// save it and return it
          final newContestant = MainContestant(
            name: playerName,
            symbol: TicTacToeSymbols.O,
          );
          await saveMainContestant(newContestant);
          return Right(newContestant);
        }
        return Left(failure);
      },
      (contestant) async {
        // Handling expected type using if statement and runtime type check
        if (contestant is Opponent) {
          return const Left(Failure.badResponse());
        }
        if (contestant.name != playerName) {
          /// If playername changed, we create a new MainContestant,
          /// save it and return it
          final newContestant = MainContestant(
            name: playerName,
            symbol: TicTacToeSymbols.O,
          );
          await saveMainContestant(newContestant);
          return Right(newContestant);
        }
        return Right(contestant as MainContestant);
      },
    );
  }

  /// Save the main contestant to keep it in memory
  Future<bool> saveMainContestant(Contestant contestant) async {
    final result = await _contestantRepository.saveMainContestant(contestant);
    return result.fold(
      (failure) => false,
      (isSaved) => isSaved,
    );
  }

  /// Clears the saved main contestant from storage
  Future<bool> clearMainContestant() async {
    final result = await _contestantRepository.clearMainContestant();
    return result.fold(
      (failure) => false,
      (isCleared) => isCleared,
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
