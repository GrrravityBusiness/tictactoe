// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GamerDTO _$GamerDTOFromJson(Map<String, dynamic> json) => _GamerDTO(
  name: json['name'] as String,
  symbol: $enumDecode(_$XorODTOEnumMap, json['symbol']),
  isMainPLayer: json['isMainContestant'] as bool,
);

Map<String, dynamic> _$GamerDTOToJson(_GamerDTO instance) => <String, dynamic>{
  'name': instance.name,
  'symbol': _$XorODTOEnumMap[instance.symbol]!,
  'isMainContestant': instance.isMainPLayer,
};

const _$XorODTOEnumMap = {XorODTO.x: 'x', XorODTO.o: 'o'};
