import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/0-onboarding/data/datasource/local_player_datasource.dart';
import 'package:tictactoe/1-features/0-onboarding/data/dto/player_dto.dart';
import 'package:tictactoe/1-features/0-onboarding/data/reporitory_impl/player_repository_impl.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/core/utils/failures.dart';

class MockLocalPlayerDatasource extends Mock implements LocalPlayerDatasource {}

Player makePlayer({String name = 'Player1'}) => Player(name: name);

void main() {
  group('PlayerRepositoryImpl', () {
    late MockLocalPlayerDatasource datasource;
    late PlayerRepositoryImpl repository;

    setUp(() {
      datasource = MockLocalPlayerDatasource();
      repository = PlayerRepositoryImpl(localPlayerDatasource: datasource);
    });

    group('deletePlayer', () {
      test('return true on success', () async {
        when(
          () => datasource.deletePlayer(),
        ).thenAnswer((_) async => right(true));

        final result = await repository.deletePlayer();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => datasource.deletePlayer()).called(1);
      });

      test('returns Failure on error', () async {
        when(
          () => datasource.deletePlayer(),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.deletePlayer();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('loadPlayer', () {
      test('return player on success', () {
        final player = makePlayer();

        when(() => datasource.loadPlayer()).thenReturn(right(player.toDTO));

        final result = repository.loadPlayer();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => null)?.name, 'Player1');

        verify(() => datasource.loadPlayer()).called(1);
      });

      test('returns null if nothing saved', () {
        when(() => datasource.loadPlayer()).thenReturn(right(null));

        final result = repository.loadPlayer();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => null), isNull);

        verify(() => datasource.loadPlayer()).called(1);
      });

      test('returns Failure on error', () {
        when(
          () => datasource.loadPlayer(),
        ).thenReturn(left(const Failure.badRequest()));

        final result = repository.loadPlayer();

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
    group('savePlayer', () {
      test('return true on success', () async {
        final player = makePlayer();

        when(
          () => datasource.savePlayer(playerDTO: player.toDTO),
        ).thenAnswer((_) async => right(true));

        final result = await repository.savePlayer(player: player);

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => false), isTrue);

        verify(() => datasource.savePlayer(playerDTO: player.toDTO)).called(1);
      });

      test('returns Failure on error', () async {
        final player = makePlayer();

        when(
          () => datasource.savePlayer(playerDTO: player.toDTO),
        ).thenAnswer((_) async => left(const Failure.badRequest()));

        final result = await repository.savePlayer(player: player);

        expect(result.isLeft(), isTrue);
        expect(result.fold((l) => l, (r) => null), isA<Failure>());
      });
    });
  });
}
