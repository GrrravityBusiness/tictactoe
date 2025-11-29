import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';

part 'score.freezed.dart';

@freezed
abstract class Score with _$Score {
  const factory Score({
    required Contestant contestant,
    required int points,
  }) = _Score;
  const Score._();
}
