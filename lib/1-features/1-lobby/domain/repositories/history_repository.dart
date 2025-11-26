import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<History>>> getHistories();
  Future<Either<Failure, bool>> clearHistories();
}
