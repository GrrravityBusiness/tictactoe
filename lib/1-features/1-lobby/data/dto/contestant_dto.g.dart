// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contestant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContestantDTO _$ContestantDTOFromJson(Map<String, dynamic> json) =>
    _ContestantDTO(
      name: json['name'] as String,
      symbol: $enumDecode(_$TicTacToeSymbolsDTOEnumMap, json['symbol']),
      isMainContestant: json['isMainContestant'] as bool,
    );

Map<String, dynamic> _$ContestantDTOToJson(_ContestantDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': _$TicTacToeSymbolsDTOEnumMap[instance.symbol]!,
      'isMainContestant': instance.isMainContestant,
    };

const _$TicTacToeSymbolsDTOEnumMap = {
  TicTacToeSymbolsDTO.X: 'x',
  TicTacToeSymbolsDTO.O: '0',
};
