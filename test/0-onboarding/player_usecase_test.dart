import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockPlayerRepository extends Mock implements PlayerRepository {}

Player makePlayer({String name = 'Player1'}) => Player(name: name);

void main() {
  group('PlayerUseCase', () {
    late MockPlayerRepository repository;
    late PlayerUseCase usecase;

    setUp(() {
      repository = MockPlayerRepository();
      usecase = PlayerUseCase(playerRepository: repository);
    });

    group('savePlayer', () {
      test('returns true on success', () async {
        final player = makePlayer();

        when(
          () => repository.savePlayer(player: player),
        ).thenAnswer((_) async => const Right(true));

        final result = await usecase.savePlayer(player: player);

        expect(result, isTrue);

        verify(() => repository.savePlayer(player: player)).called(1);
      });
      test('returns false on failure', () async {
        final player = makePlayer();

        when(
          () => repository.savePlayer(player: player),
        ).thenAnswer((_) async => const Left(Failure.badRequest()));

        final result = await usecase.savePlayer(player: player);

        expect(result, isFalse);

        verify(() => repository.savePlayer(player: player)).called(1);
      });
    });
    group('loadPlayer', () {
      test('returns player on success', () {
        final player = makePlayer();

        when(() => repository.loadPlayer()).thenReturn(Right(player));

        final result = usecase.loadPlayer();

        expect(result?.name, 'Player1');

        verify(() => repository.loadPlayer()).called(1);
      });

      test('returns null on failure', () {
        when(
          () => repository.loadPlayer(),
        ).thenReturn(const Left(Failure.badRequest()));

        final result = usecase.loadPlayer();

        expect(result, isNull);

        verify(() => repository.loadPlayer()).called(1);
      });
    });
    group('deletePlayer', () {
      test('returns true on success', () async {
        when(
          () => repository.deletePlayer(),
        ).thenAnswer((_) async => const Right(true));

        final result = await usecase.deletePlayer();

        expect(result, isTrue);

        verify(() => repository.deletePlayer()).called(1);
      });

      test('returns false on failure', () async {
        when(
          () => repository.deletePlayer(),
        ).thenAnswer((_) async => const Left(Failure.badRequest()));

        final result = await usecase.deletePlayer();

        expect(result, isFalse);

        verify(() => repository.deletePlayer()).called(1);
      });
    });
  });
}
