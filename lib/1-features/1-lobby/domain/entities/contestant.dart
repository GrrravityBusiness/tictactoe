import 'package:freezed_annotation/freezed_annotation.dart';

part 'contestant.freezed.dart';

@freezed
abstract class Contestant with _$Contestant {
  const Contestant._();

  const factory Contestant.mainContestant({
    required String name,
    required TicTacToeSymbols symbol,
  }) = MainContestant;

  const factory Contestant.opponent({
    required String name,
    required TicTacToeSymbols symbol,
  }) = Opponent;
}

enum TicTacToeSymbols {
  X,
  O,
}
