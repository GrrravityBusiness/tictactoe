// Using JsonKey to map JSON keys to different Dart property names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/data/dto/gamer_dto.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer_score.dart';

part 'gamer_score_dto.freezed.dart';
part 'gamer_score_dto.g.dart';

@freezed
abstract class GamerScoreDTO with _$GamerScoreDTO {
  const factory GamerScoreDTO({
    @JsonKey(name: 'contestant') required GamerDTO gamer,
    @JsonKey(name: 'points') required int points,
  }) = _GamerScoreDTO;
  const GamerScoreDTO._();

  factory GamerScoreDTO.fromJson(Map<String, dynamic> json) =>
      _$GamerScoreDTOFromJson(json);
}

extension OnGamerScore on GamerScore {
  /// Converts [GamerScoreDTO] to [GamerScore] entity
  GamerScoreDTO get toDTO => GamerScoreDTO(
    gamer: gamer.toDTO,
    points: points,
  );
}

extension OnGamerScoreDTO on GamerScoreDTO {
  /// Converts [GamerScore] to [GamerScoreDTO] entity
  GamerScore get toEntity => GamerScore(
    gamer: gamer.toEntity,
    points: points,
  );
}
