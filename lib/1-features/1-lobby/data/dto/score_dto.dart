import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/score.dart';

part 'score_dto.freezed.dart';
part 'score_dto.g.dart';

@freezed
abstract class ScoreDTO with _$ScoreDTO {
  const factory ScoreDTO({
    required ContestantDTO contestant,
    required int points,
  }) = _ScoreDTO;
  const ScoreDTO._();

  factory ScoreDTO.fromJson(Map<String, dynamic> json) =>
      _$ScoreDTOFromJson(json);
}

extension OnScoreDTO on ScoreDTO {
  /// Converts [ScoreDTO] to [Score] entity
  Score get toEntity => Score(
    contestant: contestant.toEntity,
    points: points,
  );
}
