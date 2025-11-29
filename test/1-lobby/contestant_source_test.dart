import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/contestant_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/core/utils/either_utils.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

ContestantDTO makeContestant({String name = 'Contestant1'}) => ContestantDTO(
  name: name,
  symbol: TicTacToeSymbolsDTO.O,
  isMainContestant: true,
);

void main() {
  group('ContestantSource', () {
    late MockSharedPreferences prefs;
    late ContestantSource datasource;

    setUp(() {
      prefs = MockSharedPreferences();
      datasource = ContestantSource(sharedPreferences: prefs);
    });

    group('getMainContestant', () {
      test(' returns saved contestant', () {
        final contestant = makeContestant();
        final encoded = jsonEncode(contestant.toJson());

        when(() => prefs.getString(any())).thenReturn(encoded);

        final result = datasource.getMainContestant();
        expect(result.isRight(), isTrue);

        final loaded = result.getRightOrNull();
        expect(loaded?.name, 'Contestant1');

        verify(
          () => prefs.getString(ContestantSource.mainContestantKey),
        ).called(1);
      });

      test('returns FailureNotFound if nothing saved', () {
        when(() => prefs.getString(any())).thenReturn(null);

        final result = datasource.getMainContestant();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());

        verify(
          () => prefs.getString(ContestantSource.mainContestantKey),
        ).called(1);
      });

      test('returns Failure on exception', () {
        when(
          () => prefs.getString(any()),
        ).thenThrow(Exception('Failed to get'));

        final result = datasource.getMainContestant();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('saveMainContestant', () {
      test('saves contestant and returns true', () async {
        when(() => prefs.setString(any(), any())).thenAnswer((_) async => true);

        final contestant = makeContestant();
        final result = await datasource.saveMainContestant(contestant);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(
          () => prefs.setString(
            ContestantSource.mainContestantKey,
            jsonEncode(contestant.toJson()),
          ),
        ).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.setString(any(), any()),
        ).thenThrow(Exception('Failed to save'));

        final contestant = makeContestant();
        final result = await datasource.saveMainContestant(contestant);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('clearMainContestant', () {
      test('removes contestant', () async {
        when(() => prefs.remove(any())).thenAnswer((_) async => true);

        final result = await datasource.clearMainContestant();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(
          () => prefs.remove(ContestantSource.mainContestantKey),
        ).called(1);
      });

      test('returns Failure on exception', () async {
        when(
          () => prefs.remove(any()),
        ).thenThrow(Exception('Failed to remove'));

        final result = await datasource.clearMainContestant();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
