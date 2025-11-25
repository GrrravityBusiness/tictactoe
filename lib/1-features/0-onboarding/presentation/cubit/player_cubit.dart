import 'package:bloc/bloc.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';

class PlayerController extends Cubit<PlayerState> {
  PlayerController({
    required PlayerUseCase playerUseCase,
  }) : _playerUseCase = playerUseCase,
       super(
         PlayerState.initial(),
       ) {
    loadPlayer();
  }

  final PlayerUseCase _playerUseCase;

  Future<bool> savePlayer() async {
    if (state.player == null) {
      return false;
    }
    final name = state.player!.name;
    final result = await _playerUseCase.savePlayer(name: name);
    return result;
  }

  void setPlayer({required String name}) {
    final player = Player(name: name);
    emit(state.copyWith(player: player));
  }

  void loadPlayer() {
    final player = _playerUseCase.loadPlayer();
    emit(state.copyWith(player: player));
  }

  Future<bool> deletePlayer() async {
    final result = await _playerUseCase.deletePlayer();
    if (result) {
      emit(PlayerState.initial());
    }
    return result;
  }
}
