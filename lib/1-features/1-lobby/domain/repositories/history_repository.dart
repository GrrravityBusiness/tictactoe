import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class HistoryRepository {
  /// Gets the list of histories from the data source
  Either<Failure, List<History>> getHistories();

  /// Clears all histories from the data source
  Future<Either<Failure, bool>> clearHistories();
}
