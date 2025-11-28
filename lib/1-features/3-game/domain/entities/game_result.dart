import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result.freezed.dart';

@freezed
abstract class GameResult with _$GameResult {
  const factory GameResult({
    int? winnningPlayer,
  }) = _GameResult;

  const GameResult._();
}

extension OnGameResult on GameResult {
  bool get draw => winnningPlayer == null;
}
