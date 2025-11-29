// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamer_score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GamerScoreDTO _$GamerScoreDTOFromJson(Map<String, dynamic> json) =>
    _GamerScoreDTO(
      gamer: GamerDTO.fromJson(json['contestant'] as Map<String, dynamic>),
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$GamerScoreDTOToJson(_GamerScoreDTO instance) =>
    <String, dynamic>{'contestant': instance.gamer, 'points': instance.points};
