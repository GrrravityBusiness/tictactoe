import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/history_repository.dart';

class HistoryUseCase {
  HistoryUseCase({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository;

  final HistoryRepository _historyRepository;

  Future<bool> clearHistories() async {
    final result = await _historyRepository.clearHistories();
    return result.fold(
      (failure) => false,
      (isCleared) => isCleared,
    );
  }

  Future<List<History>> getHistories() async {
    final result = await _historyRepository.getHistories();
    return result.fold(
      (failure) => [],
      (histories) => histories,
    );
  }
}
