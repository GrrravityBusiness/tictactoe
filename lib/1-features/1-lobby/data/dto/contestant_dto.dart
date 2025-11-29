import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';

part 'contestant_dto.freezed.dart';
part 'contestant_dto.g.dart';

@freezed
abstract class ContestantDTO with _$ContestantDTO {
  const factory ContestantDTO({
    required String name,
    required TicTacToeSymbolsDTO symbol,
    required bool isMainContestant,
  }) = _ContestantDTO;
  const ContestantDTO._();

  factory ContestantDTO.fromJson(Map<String, dynamic> json) =>
      _$ContestantDTOFromJson(json);
}

extension OnContestantDTO on ContestantDTO {
  /// Converts [ContestantDTO] to [Contestant] entity handling the type
  /// based on [isMainContestant] field
  Contestant get toEntity {
    switch (isMainContestant) {
      case true:
        return Contestant.mainContestant(
          name: name,
          symbol: symbol.toEntity,
        );
      default:
        return Contestant.opponent(
          name: name,
          symbol: symbol.toEntity,
        );
    }
  }
}

extension OnContestant on Contestant {
  /// Converts [Contestant] entity to [ContestantDTO] handling the type
  /// based on the runtime type
  ContestantDTO get toDTO {
    return ContestantDTO(
      name: name,
      symbol: symbol.toDTO,
      isMainContestant: this is MainContestant,
    );
  }
}

@JsonEnum()
enum TicTacToeSymbolsDTO {
  @JsonValue('x')
  X,
  @JsonValue('o')
  O,
}

extension OnTicTacToeSymbolsDTO on TicTacToeSymbolsDTO {
  /// Converts [TicTacToeSymbolsDTO] to [TicTacToeSymbols] entity
  TicTacToeSymbols get toEntity {
    switch (this) {
      case TicTacToeSymbolsDTO.X:
        return TicTacToeSymbols.X;
      case TicTacToeSymbolsDTO.O:
        return TicTacToeSymbols.O;
    }
  }
}

extension OnTicTacToeSymbols on TicTacToeSymbols {
  /// Converts [TicTacToeSymbols] to [TicTacToeSymbolsDTO] entity
  TicTacToeSymbolsDTO get toDTO {
    switch (this) {
      case TicTacToeSymbols.X:
        return TicTacToeSymbolsDTO.X;
      case TicTacToeSymbols.O:
        return TicTacToeSymbolsDTO.O;
    }
  }
}
