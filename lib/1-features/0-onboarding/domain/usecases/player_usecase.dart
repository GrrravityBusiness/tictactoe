import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';

class PlayerUseCase {
  PlayerUseCase({
    required PlayerRepository playerRepository,
  }) : _playerRepository = playerRepository;

  final PlayerRepository _playerRepository;

  Future<bool> savePlayer({required String name}) async {
    final player = await _playerRepository.savePlayer(
      player: Player(name: name),
    );
    return player.fold(
      // Note: out of simplicity, we return false on failure but we could
      // handle it differently if needed
      (failure) => false,
      (success) => success,
    );
  }

  Player? loadPlayer() {
    return _playerRepository.loadPlayer();
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
