// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreDTO _$ScoreDTOFromJson(Map<String, dynamic> json) => _ScoreDTO(
  contestant: ContestantDTO.fromJson(
    json['contestant'] as Map<String, dynamic>,
  ),
  points: (json['points'] as num).toInt(),
);

Map<String, dynamic> _$ScoreDTOToJson(_ScoreDTO instance) => <String, dynamic>{
  'contestant': instance.contestant,
  'points': instance.points,
};
