// Using JsonKey to map JSON keys to different Dart property names
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/data/dto/gamer_score_dto.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/final_score.dart';
import 'package:tictactoe/core/utils/custom_types.dart';

part 'final_score_dto.freezed.dart';
part 'final_score_dto.g.dart';

@freezed
abstract class FinalScoreDTO with _$FinalScoreDTO {
  const factory FinalScoreDTO({
    @JsonKey(name: 'playerScore') required GamerScoreDTO mainPlayerScore,
    @JsonKey(name: 'opponentScore') required GamerScoreDTO opponentScore,
  }) = _FinalScoreDTO;
  const FinalScoreDTO._();

  factory FinalScoreDTO.fromJson(Map<String, dynamic> json) =>
      _$FinalScoreDTOFromJson(json);
}

extension OnFinalScore on FinalScore {
  /// Converts [FinalScoreDTO] to [FinalScore] entity
  FinalScoreDTO get toDTO => FinalScoreDTO(
    mainPlayerScore: mainPlayerScore.toDTO,
    opponentScore: opponentScore.toDTO,
  );
}

extension OnJsonListFinalScoreDTO on JsonList {
  /// Utility function to map a list of JSON final score into a
  /// list of FinalScoreDTO
  List<FinalScoreDTO> get toFinalScoreDTO =>
      map(FinalScoreDTO.fromJson).toList();
}

extension OnListFinalScoreDTO on List<FinalScoreDTO> {
  /// Utility function to map a list of FinalScoreDTO into a list of JSON
  JsonList get toJsonList =>
      map((finalScoreDTO) => finalScoreDTO.toJson()).toList();
  List<FinalScore> get toEntity =>
      map((finalScoreDTO) => finalScoreDTO.toEntity).toList();
}

extension OnListFinalScore on List<FinalScore> {
  List<FinalScoreDTO> get toDTO =>
      map((finalScore) => finalScore.toDTO).toList();
}

extension OnFinalScoreDTO on FinalScoreDTO {
  /// Converts [FinalScoreDTO] to [FinalScore] entity
  FinalScore get toEntity => FinalScore(
    mainPlayerScore: mainPlayerScore.toEntity,
    opponentScore: opponentScore.toEntity,
  );
}
