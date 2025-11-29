import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/3-game/data/datasource/score_datasource.dart';
import 'package:tictactoe/1-features/3-game/data/dto/final_score_dto.dart';
import 'package:tictactoe/1-features/3-game/data/dto/gamer_dto.dart';
import 'package:tictactoe/1-features/3-game/data/dto/gamer_score_dto.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

FinalScoreDTO makeScore({int score = 1}) => FinalScoreDTO(
  mainPlayerScore: GamerScoreDTO(
    gamer: const GamerDTO(
      name: 'Player1',
      symbol: XorODTO.x,
      isMainPLayer: true,
    ),
    points: score,
  ),
  opponentScore: GamerScoreDTO(
    gamer: const GamerDTO(
      name: 'Player2',
      symbol: XorODTO.o,
      isMainPLayer: false,
    ),
    points: score + 1,
  ),
);

void main() {
  group('ScoreDatasource', () {
    late MockSharedPreferences prefs;
    late ScoreDatasource datasource;

    setUp(() {
      prefs = MockSharedPreferences();
      datasource = ScoreDatasource(sharedPreferences: prefs);
    });

    group('saveScore', () {
      test('saves scores and returns true', () async {
        when(
          () => prefs.setStringList(any(), any()),
        ).thenAnswer((_) async => true);

        final scores = [makeScore(), makeScore(score: 2)];
        final result = await datasource.saveScore(finalScoreDTO: scores);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(
          () => prefs.setStringList(ScoreDatasource.finalScoreKey, any()),
        ).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.setStringList(any(), any()),
        ).thenThrow(Exception('Failed to save'));

        final scores = [makeScore()];
        final result = await datasource.saveScore(finalScoreDTO: scores);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('getScores', () {
      test('returns saved scores', () async {
        final scores = [makeScore(), makeScore(score: 2)];
        final encoded = scores.map((e) => jsonEncode(e.toJson())).toList();
        when(() => prefs.getStringList(any())).thenReturn(encoded);

        final result = datasource.getScores();
        expect(result.isRight(), isTrue);

        final list = result.getOrElse(() => []);
        expect(list.length, 2);
        expect(list.first.mainPlayerScore.gamer.name, 'Player1');
        expect(list.first.mainPlayerScore.points, 1);
        expect(list.last.opponentScore.gamer.name, 'Player2');
        expect(list.last.opponentScore.points, 3);

        verify(
          () => prefs.getStringList(ScoreDatasource.finalScoreKey),
        ).called(1);
      });

      test('returns empty list if nothing saved', () {
        when(() => prefs.getStringList(any())).thenReturn(null);

        final result = datasource.getScores();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => []), isEmpty);

        verify(
          () => prefs.getStringList(ScoreDatasource.finalScoreKey),
        ).called(1);
      });

      test('returns Failure on exception', () {
        when(
          () => prefs.getStringList(any()),
        ).thenThrow(Exception('Failed to get'));

        final result = datasource.getScores();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('clearScores', () {
      test('removes all scores', () async {
        when(() => prefs.remove(any())).thenAnswer((_) async => true);

        final clearResult = await datasource.clearScores();

        expect(clearResult.isRight(), isTrue);
        expect(clearResult.getOrElse(() => false), isTrue);

        verify(() => prefs.remove(ScoreDatasource.finalScoreKey)).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.remove(any()),
        ).thenThrow(Exception('Failed to remove'));

        final result = await datasource.clearScores();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
