import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/0-onboarding/data/dto/player_dto.dart';
import 'package:tictactoe/core/utils/failures.dart';

class LocalPlayerDatasource {
  LocalPlayerDatasource({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const _playerKey = 'player';

  /// Saves the player data to local storage, returns a [Failure] on error or
  /// a [bool] indicating success.
  ///
  /// Failure cases:
  /// SharedPreference could throw a [PlatformException]
  /// Json methods could throw a [FormatException]
  Future<Either<Failure, bool>> savePlayer({
    required PlayerDTO playerDTO,
  }) async => Failure.guard(
    () async => _sharedPreferences.setString(
      _playerKey,
      jsonEncode(playerDTO.toJson()),
    ),
  );

  /// Loads the player data from local storage, returns null if
  /// no player is found.
  ///
  /// Failure cases:
  /// SharedPreference could throw a [PlatformException]
  /// Json methods could throw a [FormatException]
  Either<Failure, PlayerDTO?> loadPlayer() {
    return Failure.guardSync(() {
      final playerJson = _sharedPreferences.getString(_playerKey);
      if (playerJson == null) {
        return null;
      }
      final decodedPlayer = jsonDecode(playerJson);
      return PlayerDTO.fromJson(decodedPlayer as Map<String, dynamic>);
    });
  }

  /// Deletes the player data from local storage, returns a [Failure]
  /// on error or a [bool] indicating success.
  ///
  /// Failure cases:
  /// SharedPreference could throw a [PlatformException]
  Future<Either<Failure, bool>> deletePlayer() async =>
      Failure.guard(() async => _sharedPreferences.remove(_playerKey));
}
