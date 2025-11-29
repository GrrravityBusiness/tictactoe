// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinalScoreDTO _$FinalScoreDTOFromJson(Map<String, dynamic> json) =>
    _FinalScoreDTO(
      mainPlayerScore: GamerScoreDTO.fromJson(
        json['playerScore'] as Map<String, dynamic>,
      ),
      opponentScore: GamerScoreDTO.fromJson(
        json['opponentScore'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FinalScoreDTOToJson(_FinalScoreDTO instance) =>
    <String, dynamic>{
      'playerScore': instance.mainPlayerScore,
      'opponentScore': instance.opponentScore,
    };
