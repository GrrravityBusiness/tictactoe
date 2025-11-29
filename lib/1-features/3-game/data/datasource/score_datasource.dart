import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/3-game/data/dto/final_score_dto.dart';
import 'package:tictactoe/core/utils/custom_types.dart';
import 'package:tictactoe/core/utils/failures.dart';

class ScoreDatasource {
  ScoreDatasource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  static const String finalScoreKey = 'game_history';

  /// Save final scores list to local storage. It's overriding any
  /// existing data so make sure to retrieve existing data first, upsert it,
  /// then save it back.
  Future<Either<Failure, bool>> saveScore({
    required List<FinalScoreDTO> finalScoreDTO,
  }) async => Failure.guard(() async {
    final isSaved = await _sharedPreferences.setStringList(
      finalScoreKey,
      finalScoreDTO.map((e) => jsonEncode(e.toJson())).toList(),
    );
    return isSaved;
  });

  /// Get final scores list from local storage. If no data found, returns
  /// an empty list.
  Either<Failure, List<FinalScoreDTO>> getScores() {
    return Failure.guardSync(() {
      final historiesOrNull = _sharedPreferences.getStringList(finalScoreKey);
      if (historiesOrNull == null) {
        return <FinalScoreDTO>[];
      }
      final jsonList = historiesOrNull
          .map((e) => jsonDecode(e) as Json)
          .toList();
      return jsonList.toFinalScoreDTO;
    });
  }

  /// Clear all final scores from local storage.
  Future<Either<Failure, bool>> clearScores() {
    return Failure.guard(() async {
      return _sharedPreferences.remove(finalScoreKey);
    });
  }
}
