import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';

part 'gamer_score.freezed.dart';

@freezed
abstract class GamerScore with _$GamerScore {
  const factory GamerScore({
    required int points,
    required GamerCmd gamer,
  }) = _GamerScore;
  const GamerScore._();
}
