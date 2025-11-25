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

  /// Save the current player into local storage, returns true on success.
  /// It will not save if the player is null or the name is empty.
  /// this will not emit any state change.
  Future<bool> savePlayer() async {
    if (state.player == null || state.player!.name.isEmpty) {
      return false;
    }
    final result = await _playerUseCase.savePlayer(player: state.player!);
    return result;
  }

  /// Set current state with new player name and emit a change
  void setPlayer({required String name}) {
    final player = Player(name: name);
    emit(state.copyWith(player: player));
  }

  /// Load the player from local storage and emit a state change with the given
  /// player
  void loadPlayer() {
    final player = _playerUseCase.loadPlayer();
    // Note : player could be null but at this point, there isn't any cases
    // where this is problematic as loadPlayer is called only once at init
    emit(state.copyWith(player: player));
  }

  /// Delete the player from local storage, emits initial state on success.
  Future<bool> deletePlayer() async {
    final result = await _playerUseCase.deletePlayer();
    if (result) {
      emit(PlayerState.initial());
    }
    return result;
  }
}
