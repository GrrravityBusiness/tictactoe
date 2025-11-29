import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/core/utils/custom_types.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ContestantSource {
  ContestantSource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const String mainContestantKey = 'main_contestant';
  static const String opponentKey = 'opponent';

  /// Retrieving main contestant from local storage
  /// Returns a  [ContestantDTO] wrapped in an [Either]
  /// to handle potential failures
  ///
  /// Will throw [FailureNotFound] if not found
  ///
  /// this will jsonDecode a strings, so [FormatException] may occur
  Either<Failure, ContestantDTO> getMainContestant() {
    return Failure.guardSync(() {
      final contestantOrNull = _sharedPreferences.getString(
        mainContestantKey,
      );
      if (contestantOrNull == null) {
        throw const Failure.elementNotFound();
      }
      return ContestantDTO.fromJson(
        jsonDecode(contestantOrNull) as Json,
      );
    });
  }

  /// Save main contestant to local storage
  /// Returns a [bool] wrapped in an [Either] to indicate success or failure
  ///
  /// Will overwrite any existing opponent
  Future<Either<Failure, bool>> saveMainContestant(
    ContestantDTO contestant,
  ) async {
    return Failure.guard(() async {
      final jsonString = jsonEncode(contestant.toJson());
      return _sharedPreferences.setString(
        mainContestantKey,
        jsonString,
      );
    });
  }

  /// Clears the main contestant from local storage
  /// Returns a [bool] wrapped in an [Either] to indicate success or failure
  Future<Either<Failure, bool>> clearMainContestant() async {
    return Failure.guard(() async {
      return _sharedPreferences.remove(mainContestantKey);
    });
  }

  /// Retrieving opponent from local storage
  /// Returns a  [ContestantDTO] wrapped in an [Either]
  /// to handle potential failures
  ///
  /// Will return null if not found
  ///
  /// this will jsonDecode a strings, so [FormatException] may occur
  Either<Failure, ContestantDTO?> getOpponent() {
    return Failure.guardSync(() {
      final contestantOrNull = _sharedPreferences.getString(
        opponentKey,
      );
      if (contestantOrNull == null) {
        return null;
      }
      return ContestantDTO.fromJson(
        jsonDecode(contestantOrNull) as Json,
      );
    });
  }

  /// Save opponent to local storage
  /// Returns a [bool] wrapped in an [Either] to indicate success or failure
  ///
  /// Will overwrite any existing opponent
  Future<Either<Failure, bool>> saveOpponent(
    ContestantDTO contestant,
  ) async {
    return Failure.guard(() async {
      final jsonString = jsonEncode(contestant.toJson());
      return _sharedPreferences.setString(
        opponentKey,
        jsonString,
      );
    });
  }

  /// Clears the opponent from local storage
  /// Returns a [bool] wrapped in an [Either] to indicate success or failure
  Future<Either<Failure, bool>> clearOpponent() async {
    return Failure.guard(() async {
      return _sharedPreferences.remove(opponentKey);
    });
  }
}
