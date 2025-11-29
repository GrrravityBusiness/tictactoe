import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/score_dto.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/core/utils/custom_types.dart';

part 'history_dto.freezed.dart';
part 'history_dto.g.dart';

@freezed
abstract class HistoryDTO with _$HistoryDTO {
  const factory HistoryDTO({
    required ScoreDTO playerScore,
    required ScoreDTO opponentScore,
  }) = _HistoryDTO;
  const HistoryDTO._();

  factory HistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$HistoryDTOFromJson(json);
}

extension OnJsonListHistoryDTO on JsonList {
  /// Utility function to map a list of JSON history into a list of HistoryDTO
  List<HistoryDTO> get toHistoryDTOList => map(HistoryDTO.fromJson).toList();
}

extension OnListHistoryDTO on List<HistoryDTO> {
  /// Utility function to map a list of HistoryDTO into a list of JSON
  JsonList get toJsonList => map((historyDTO) => historyDTO.toJson()).toList();
  List<History> get toEntity =>
      map((historyDTO) => historyDTO.toEntity).toList();
}

extension OnHistoryDTO on HistoryDTO {
  /// Converts [HistoryDTO] to [History] entity
  History get toEntity => History(
    playerScore: playerScore.toEntity,
    opponentScore: opponentScore.toEntity,
  );
}
