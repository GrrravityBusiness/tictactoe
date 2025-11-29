import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/utils/game_utils.dart';

part 'gamer.freezed.dart';

@freezed
abstract class Gamer with _$Gamer {
  const factory Gamer({
    required String name,
    required int remainingCounts,
    required int wins,
    required XorO symbol,
  }) = _Gamer;

  const Gamer._();
}

@freezed
abstract class GamerCmd with _$GamerCmd {
  const factory GamerCmd({
    required String name,
    required XorO symbol,
  }) = _GamerCmd;

  const GamerCmd._();
}

extension OnGamer on Gamer {
  GamerCmd get toCmd => GamerCmd(
    name: name,
    symbol: symbol,
  );
}
