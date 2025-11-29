// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryDTO _$HistoryDTOFromJson(Map<String, dynamic> json) => _HistoryDTO(
  playerScore: ScoreDTO.fromJson(json['playerScore'] as Map<String, dynamic>),
  opponentScore: ScoreDTO.fromJson(
    json['opponentScore'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$HistoryDTOToJson(_HistoryDTO instance) =>
    <String, dynamic>{
      'playerScore': instance.playerScore,
      'opponentScore': instance.opponentScore,
    };
