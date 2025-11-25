import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';

part 'player_state.freezed.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState({
    required Player? player,
  }) = _PlayerState;

  factory PlayerState.initial() => const PlayerState(player: null);

  const PlayerState._();
}
