import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/history_dto.dart';
import 'package:tictactoe/core/utils/custom_types.dart';
import 'package:tictactoe/core/utils/failures.dart';

class HistorySource {
  HistorySource({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const String historyKey = 'game_history';

  /// Retrieving history from local storage
  /// Returns a [List] of [HistoryDTO] wrapped in an [Either]
  /// to handle potential failures
  ///
  /// Will return an empty list if no history is found
  ///
  /// this will jsonDecode a list of strings, so [FormatException] may occur
  Either<Failure, List<HistoryDTO>> getHistories() {
    return Failure.guardSync(() {
      final historiesOrNull = _sharedPreferences.getStringList(historyKey);
      if (historiesOrNull == null) {
        return <HistoryDTO>[];
      }
      final jsonList = historiesOrNull
          .map((e) => jsonDecode(e) as Json)
          .toList();
      return jsonList.toHistoryDTOList;
    });
  }

  /// Clears the history from local storage
  /// Returns a [bool] wrapped in an [Either] to indicate success or failure
  Future<Either<Failure, bool>> clearHistories() async {
    return Failure.guard(() async {
      return _sharedPreferences.remove(historyKey);
    });
  }
}
