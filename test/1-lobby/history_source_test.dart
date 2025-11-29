import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/history_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/history_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/score_dto.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

HistoryDTO makeHistory({int score = 1}) => HistoryDTO(
  playerScore: ScoreDTO(
    contestant: const ContestantDTO(
      name: 'Player1',
      symbol: TicTacToeSymbolsDTO.X,
      isMainContestant: true,
    ),
    points: score,
  ),
  opponentScore: ScoreDTO(
    contestant: const ContestantDTO(
      name: 'Player2',
      symbol: TicTacToeSymbolsDTO.O,
      isMainContestant: false,
    ),
    points: score + 1,
  ),
);

void main() {
  group('HistorySource', () {
    late MockSharedPreferences prefs;
    late HistorySource datasource;

    setUp(() {
      prefs = MockSharedPreferences();
      datasource = HistorySource(sharedPreferences: prefs);
    });

    test('getHistories returns saved histories', () {
      final histories = [makeHistory(), makeHistory(score: 2)];
      final encoded = histories.map((e) => jsonEncode(e.toJson())).toList();
      when(() => prefs.getStringList(any())).thenReturn(encoded);
      final result = datasource.getHistories();
      expect(result.isRight(), isTrue);
      final list = result.getOrElse(() => []);
      expect(list.length, 2);
      expect(list.first.playerScore.points, 1);
      expect(list.last.playerScore.points, 2);
      verify(() => prefs.getStringList(HistorySource.historyKey)).called(1);
    });

    test('getHistories returns empty list if nothing saved', () {
      when(() => prefs.getStringList(any())).thenReturn(null);
      final result = datasource.getHistories();
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => []), isEmpty);
      verify(() => prefs.getStringList(HistorySource.historyKey)).called(1);
    });

    test('getHistories returns Failure on exception', () {
      when(
        () => prefs.getStringList(any()),
      ).thenThrow(Exception('Failed to get'));
      final result = datasource.getHistories();
      expect(result.isLeft(), isTrue);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
    });

    test('clearHistories removes all histories', () async {
      when(() => prefs.remove(any())).thenAnswer((_) async => true);
      final result = await datasource.clearHistories();
      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => false), isTrue);
      verify(() => prefs.remove(HistorySource.historyKey)).called(1);
    });

    test('clearHistories returns Failure on exception', () async {
      when(() => prefs.remove(any())).thenThrow(Exception('Failed to remove'));
      final result = await datasource.clearHistories();
      expect(result.isLeft(), isTrue);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
    });
  });
}
