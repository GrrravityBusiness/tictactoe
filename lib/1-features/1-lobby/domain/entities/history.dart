import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';

part 'history.freezed.dart';

@freezed
abstract class History with _$History {
  const factory History({
    required Score playerScore,
    required Score opponentScore,
  }) = _History;
  const History._();
}
