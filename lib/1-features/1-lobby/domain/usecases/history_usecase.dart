import 'package:tictactoe/1-features/1-lobby/domain/entities/history.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/history_repository.dart';

class HistoryUseCase {
  HistoryUseCase({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository;

  final HistoryRepository _historyRepository;

  /// Clears all histories from storage, returning true if successful
  Future<bool> clearHistories() async {
    final result = await _historyRepository.clearHistories();
    return result.fold(
      (failure) => false,
      (isCleared) => isCleared,
    );
  }

  /// Gets the list of histories from storage,
  /// returning an empty list if there is a failure
  List<History> getHistories() {
    final result = _historyRepository.getHistories();
    return result.fold(
      (failure) => [],
      (histories) => histories,
    );
  }
}
