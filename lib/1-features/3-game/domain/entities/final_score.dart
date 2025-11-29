import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer_score.dart';

part 'final_score.freezed.dart';

@freezed
abstract class FinalScore with _$FinalScore {
  const factory FinalScore({
    required GamerScore mainPlayerScore,
    required GamerScore opponentScore,
  }) = _FinalScore;
  const FinalScore._();
}
