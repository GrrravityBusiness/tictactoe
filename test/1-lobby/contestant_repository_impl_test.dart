import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/1-lobby/data/datasources/contestant_source.dart';
import 'package:tictactoe/1-features/1-lobby/data/dto/contestant_dto.dart';
import 'package:tictactoe/1-features/1-lobby/data/repository_impl/contestant_repository_impl.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/core/utils/either_utils.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockContestantSource extends Mock implements ContestantSource {}

Contestant makeContestant({String name = 'Contestant1'}) =>
    Contestant.mainContestant(
      name: name,
      symbol: TicTacToeSymbols.X,
    );

void main() {
  group('ContestantRepositoryImpl', () {
    late MockContestantSource source;
    late ContestantRepositoryImpl repository;

    setUp(() {
      source = MockContestantSource();
      repository = ContestantRepositoryImpl(contestantSource: source);
    });

    group('getMainContestant', () {
      test('return main contestant on success', () {
        final contestant = makeContestant();

        when(
          () => source.getMainContestant(),
        ).thenReturn(right(contestant.toDTO));

        final result = repository.getMainContestant();

        expect(result.isRight(), isTrue);
        expect(result.getRightOrNull()?.name, 'Contestant1');

        verify(() => source.getMainContestant()).called(1);
      });

      test('returns Failure on error', () {
        when(
          () => source.getMainContestant(),
        ).thenReturn(left(const Failure.badRequest()));

        final result = repository.getMainContestant();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('getOpponent', () {
      test('return opponent on success', () {
        final contestant = makeContestant(name: 'Opponent1');

        when(() => source.getOpponent()).thenReturn(right(contestant.toDTO));

        final result = repository.getOpponent();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => null)?.name, 'Opponent1');

        verify(() => source.getOpponent()).called(1);
      });

      test('returns Failure on error', () {
        when(
          () => source.getOpponent(),
        ).thenReturn(left(const Failure.badRequest()));

        final result = repository.getOpponent();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('saveMainContestant', () {
      test('return true on success', () async {
        final contestant = makeContestant();
        final contestantDTO = contestant.toDTO;

        when(
          () => source.saveMainContestant(contestantDTO),
        ).thenAnswer((_) async => right(true));

        final result = await repository.saveMainContestant(contestant);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => source.saveMainContestant(contestantDTO)).called(1);
      });
      test('saveMainContestant returns Failure on error', () async {
        final contestant = makeContestant();
        final contestantDTO = contestant.toDTO;

        when(
          () => source.saveMainContestant(contestantDTO),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.saveMainContestant(contestant);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('saveOpponent', () {
      test('return true on success', () async {
        final contestant = makeContestant(name: 'Opponent1');
        final contestantDTO = contestant.toDTO;

        when(
          () => source.saveOpponent(contestantDTO),
        ).thenAnswer((_) async => right(true));

        final result = await repository.saveOpponent(contestant);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => source.saveOpponent(contestantDTO)).called(1);
      });

      test('saveOpponent returns Failure on error', () async {
        final contestant = makeContestant(name: 'Opponent1');
        final contestantDTO = contestant.toDTO;

        when(
          () => source.saveOpponent(contestantDTO),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.saveOpponent(contestant);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('clearMainContestant', () {
      test('return true on success', () async {
        when(
          () => source.clearMainContestant(),
        ).thenAnswer((_) async => right(true));

        final result = await repository.clearMainContestant();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => source.clearMainContestant()).called(1);
      });

      test('returns Failure on error', () async {
        when(
          () => source.clearMainContestant(),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.clearMainContestant();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });

    group('clearOpponent', () {
      test('return true on success', () async {
        when(() => source.clearOpponent()).thenAnswer((_) async => right(true));

        final result = await repository.clearOpponent();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => source.clearOpponent()).called(1);
      });

      test('returns Failure on error', () async {
        when(
          () => source.clearOpponent(),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.clearOpponent();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
