import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/1-lobby/domain/entities/contestant.dart';
import 'package:tictactoe/1-features/1-lobby/domain/repositories/contestant_repository.dart';
import 'package:tictactoe/1-features/1-lobby/domain/usecases/contestant_usecase.dart';
import 'package:tictactoe/core/utils/either_utils.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockContestantRepository extends Mock implements ContestantRepository {}

MainContestant makeMainContestant({String name = 'Contestant1'}) =>
    MainContestant(name: name, symbol: TicTacToeSymbols.X);
Opponent makeOpponent({String name = 'Opponent1'}) =>
    Opponent(name: name, symbol: TicTacToeSymbols.O);

void main() {
  group('ContestantUseCase', () {
    late MockContestantRepository repository;
    late ContestantUseCase usecase;

    setUp(() {
      repository = MockContestantRepository();
      usecase = ContestantUseCase(contestantRepository: repository);
    });

    group('getMainContestant', () {
      test('returns MainContestant on success', () async {
        final main = makeMainContestant();

        when(() => repository.getMainContestant()).thenReturn(Right(main));

        final result = await usecase.getMainContestant(playerName: main.name);

        expect(result.isRight(), isTrue);
        expect(result.getRightOrNull()?.name, main.name);

        verify(() => repository.getMainContestant()).called(1);
      });

      test(
        'returns Failure.badResponse for Opponent',
        () async {
          final opponent = makeOpponent();

          when(
            () => repository.getMainContestant(),
          ).thenReturn(Right(opponent));

          final result = await usecase.getMainContestant(
            playerName: 'Contestant1',
          );

          expect(result.isLeft(), isTrue);
          expect(result.fold((l) => l, (r) => null), isA<Failure>());

          verify(() => repository.getMainContestant()).called(1);
        },
      );

      test('returns new MainContestant if not found', () async {
        when(
          () => repository.getMainContestant(),
        ).thenReturn(const Left(Failure.elementNotFound()));

        final newMain = makeMainContestant(name: 'NewPlayer');

        when(
          () => repository.saveMainContestant(newMain),
        ).thenAnswer((_) async => const Right(true));
        when(
          () => repository.getMainContestant(),
        ).thenReturn(Right(newMain));

        final result = await usecase.getMainContestant(playerName: 'NewPlayer');

        expect(result.isRight(), isTrue);
        expect(result.getRightOrNull()?.name, 'NewPlayer');
      });
    });
    group('saveMainContestant', () {
      test('returns true on success', () async {
        final main = makeMainContestant();

        when(
          () => repository.saveMainContestant(main),
        ).thenAnswer((_) async => const Right(true));

        final result = await usecase.saveMainContestant(main);

        expect(result, isTrue);

        verify(() => repository.saveMainContestant(main)).called(1);
      });

      test('returns false on failure', () async {
        final main = makeMainContestant();

        when(
          () => repository.saveMainContestant(main),
        ).thenAnswer((_) async => const Left(Failure.elementNotFound()));

        final result = await usecase.saveMainContestant(main);

        expect(result, isFalse);

        verify(() => repository.saveMainContestant(main)).called(1);
      });
    });
    group('clearMainContestant', () {
      test('returns true on success', () async {
        when(
          () => repository.clearMainContestant(),
        ).thenAnswer((_) async => const Right(true));

        final result = await usecase.clearMainContestant();

        expect(result, isTrue);

        verify(() => repository.clearMainContestant()).called(1);
      });

      test('returns false on failure', () async {
        when(
          () => repository.clearMainContestant(),
        ).thenAnswer((_) async => const Left(Failure.elementNotFound()));

        final result = await usecase.clearMainContestant();

        expect(result, isFalse);

        verify(() => repository.clearMainContestant()).called(1);
      });
    });

    group('getOpponent', () {
      test('returns Opponent on success', () {
        final opponent = makeOpponent();

        when(() => repository.getOpponent()).thenReturn(Right(opponent));

        final result = usecase.getOpponent();

        expect(result.isRight(), isTrue);
        expect(result.getRightOrNull()?.name, opponent.name);

        verify(() => repository.getOpponent()).called(1);
      });

      test('returns Failure.badResponse for MainContestant', () {
        final main = makeMainContestant();

        when(() => repository.getOpponent()).thenReturn(Right(main));

        final result = usecase.getOpponent();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());

        verify(() => repository.getOpponent()).called(1);
      });
    });
  });
}
