import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';

class PlayerUseCase {
  PlayerUseCase({
    required PlayerRepository playerRepository,
  }) : _playerRepository = playerRepository;

  final PlayerRepository _playerRepository;

  /// Saves the current name into local storage, returns true on success.
  /// failures are shadowed and false is returned instead.
  Future<bool> savePlayer({required Player player}) async {
    final savedOrFailure = await _playerRepository.savePlayer(
      player: player,
    );
    return savedOrFailure.fold(
      // Note: out of simplicity, we return false on failure but we could
      // handle it differently if needed
      (failure) => false,
      (success) => success,
    );
  }

  Player? loadPlayer() {
    final playerOrFailure = _playerRepository.loadPlayer();

    return playerOrFailure.fold(
      // Note: out of simplicity, we return null on failure but we could
      // handle it differently if needed
      (failure) => null,
      (player) => player,
    );
  }

  Future<bool> deletePlayer() async {
    final result = await _playerRepository.deletePlayer();
    return result.fold(
      // Note: out of simplicity, we return false on failure but we could
      // handle it differently if needed
      (failure) => false,
      (success) => success,
    );
  }
}
