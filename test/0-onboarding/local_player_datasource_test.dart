import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/0-onboarding/data/datasource/local_player_datasource.dart';
import 'package:tictactoe/1-features/0-onboarding/data/dto/player_dto.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

PlayerDTO makePlayer({String name = 'Player1'}) => PlayerDTO(name: name);

void main() {
  group('LocalPlayerDatasource', () {
    late MockSharedPreferences prefs;
    late LocalPlayerDatasource datasource;

    setUp(() {
      prefs = MockSharedPreferences();
      datasource = LocalPlayerDatasource(sharedPreferences: prefs);
    });

    group('savePlayer', () {
      test('saves player and returns true', () async {
        when(() => prefs.setString(any(), any())).thenAnswer((_) async => true);

        final player = makePlayer();
        final result = await datasource.savePlayer(playerDTO: player);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(
          () => prefs.setString('player', jsonEncode(player.toJson())),
        ).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.setString(any(), any()),
        ).thenThrow(Exception('Failed to save'));

        final player = makePlayer();
        final result = await datasource.savePlayer(playerDTO: player);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('loadPlayer', () {
      test('returns saved player', () {
        final player = makePlayer();
        final encoded = jsonEncode(player.toJson());

        when(() => prefs.getString(any())).thenReturn(encoded);

        final result = datasource.loadPlayer();

        expect(result.isRight(), isTrue);

        final loaded = result.getOrElse(() => null);

        expect(loaded?.name, 'Player1');

        verify(() => prefs.getString('player')).called(1);
      });

      test('returns null if nothing saved', () {
        when(() => prefs.getString(any())).thenReturn(null);

        final result = datasource.loadPlayer();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => null), isNull);

        verify(() => prefs.getString('player')).called(1);
      });
    });

    test('returns Failure on exception', () {
      when(() => prefs.getString(any())).thenThrow(Exception('Failed to get'));

      final result = datasource.loadPlayer();

      expect(result.isLeft(), isTrue);
      expect(result.fold((l) => l, (r) => null), isA<Failure>());
    });
    group('deletePlayer', () {
      test('removes player', () async {
        when(() => prefs.remove(any())).thenAnswer((_) async => true);

        final result = await datasource.deletePlayer();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => prefs.remove('player')).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.remove(any()),
        ).thenThrow(Exception('Failed to remove'));

        final result = await datasource.deletePlayer();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
