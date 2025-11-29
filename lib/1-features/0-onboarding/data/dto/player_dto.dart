import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';

part 'player_dto.freezed.dart';
part 'player_dto.g.dart';

@freezed
abstract class PlayerDTO with _$PlayerDTO {
  const factory PlayerDTO({
    required String name,
  }) = _PlayerDTO;
  const PlayerDTO._();

  factory PlayerDTO.fromJson(Map<String, dynamic> json) =>
      _$PlayerDTOFromJson(json);
}

/// PlayerDTO extension to manipulate DTO through utility methods.
extension OnPlayerDTO on PlayerDTO {
  /// DTO to Entity mapper
  Player get toEntity => Player(name: name);
}

/// Player extension to manipulate entity into datasource objects through
/// utility methods.
extension OnPlayer on Player {
  /// Entity to DTO mapper
  PlayerDTO get toDTO => PlayerDTO(name: name);
}
