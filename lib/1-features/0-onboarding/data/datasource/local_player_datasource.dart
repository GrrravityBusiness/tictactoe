import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/0-onboarding/data/dto/player_dto.dart';
import 'package:tictactoe/core/utils/failures.dart';

class LocalPlayerDatasource {
  LocalPlayerDatasource({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const _playerKey = 'player';

  Future<Either<Failure, bool>> savePlayer({
    required PlayerDTO playerDTO,
  }) async => Failure.guard(
    () async => _sharedPreferences.setString(
      _playerKey,
      jsonEncode(playerDTO.toJson()),
    ),
  );

  PlayerDTO? loadPlayer() {
    final playerJson = _sharedPreferences.getString(_playerKey);
    if (playerJson == null) {
      return null;
    }
    final decodedPlayer = jsonDecode(playerJson);
    return PlayerDTO.fromJson(decodedPlayer as Map<String, dynamic>);
  }

  Future<Either<Failure, bool>> deletePlayer() async =>
      Failure.guard(() async => _sharedPreferences.remove(_playerKey));
}
