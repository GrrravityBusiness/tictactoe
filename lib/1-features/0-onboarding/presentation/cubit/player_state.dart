import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';

part 'player_state.freezed.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState({
    required Player? player,
    required bool saved,
  }) = _PlayerState;

  /// Utility factory to create the initial state with no player.
  factory PlayerState.initial() =>
      const PlayerState(player: null, saved: false);
  const PlayerState._();
}

extension PlayerStateX on PlayerState {
  /// Returns true if a player is set and has a non-empty name.
  bool get isPlayerValid => player != null && player!.name.isNotEmpty;
}
