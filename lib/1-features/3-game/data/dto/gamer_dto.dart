// Using JsonKey to map JSON keys to different Dart property names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/3-game/domain/entities/gamer.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

part 'gamer_dto.freezed.dart';
part 'gamer_dto.g.dart';

@freezed
abstract class GamerDTO with _$GamerDTO {
  const factory GamerDTO({
    required String name,
    required XorODTO symbol,
    @JsonKey(name: 'isMainContestant') required bool isMainPLayer,
  }) = _GamerDTO;
  const GamerDTO._();

  factory GamerDTO.fromJson(Map<String, dynamic> json) =>
      _$GamerDTOFromJson(json);
}

extension OnGamer on GamerCmd {
  /// Converts [GamerDTO] to [Gamer] entity
  GamerDTO get toDTO => GamerDTO(
    name: name,
    symbol: symbol.toDTO,
    isMainPLayer: symbol == XorO.x,
  );
}

extension OnGamerDTO on GamerDTO {
  /// Converts [Gamer] to [GamerDTO] entity
  GamerCmd get toEntity => GamerCmd(
    name: name,
    symbol: symbol.toEntity,
  );
}

@JsonEnum()
enum XorODTO {
  @JsonValue('x')
  x,
  @JsonValue('o')
  o,
}

extension OnXorO on XorO {
  XorODTO get toDTO {
    switch (this) {
      case XorO.x:
        return XorODTO.x;
      case XorO.o:
        return XorODTO.o;
    }
  }
}

extension OnXorODTO on XorODTO {
  XorO get toEntity {
    switch (this) {
      case XorODTO.x:
        return XorO.x;
      case XorODTO.o:
        return XorO.o;
    }
  }
}
