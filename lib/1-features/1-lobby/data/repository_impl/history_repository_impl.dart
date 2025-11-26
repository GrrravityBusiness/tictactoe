import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/history_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/history_dto.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/history_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRepositoryImpl({required HistorySource historySource})
    : _historySource = historySource;

  final HistorySource _historySource;

  @override
  /// Clears all histories from the data source
  Future<Either<Failure, bool>> clearHistories() =>
      _historySource.clearHistories();

  @override
  /// Gets the list of histories from the data source and
  /// converts them to entity objects
  Either<Failure, List<History>> getHistories() {
    final historiesOrFailure = _historySource.getHistories();
    return historiesOrFailure.map(
      (historyDTOs) => historyDTOs.toEntity,
    );
  }
}
