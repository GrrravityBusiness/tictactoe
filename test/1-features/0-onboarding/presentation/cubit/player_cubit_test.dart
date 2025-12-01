import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/usecases/player_usecase.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_cubit.dart';
import 'package:tictactoe/1-features/0-onboarding/presentation/cubit/player_state.dart';

class MockPlayerUseCase extends Mock implements PlayerUseCase {}

void main() {
  group('PlayerController (bloc_test)', () {
    late MockPlayerUseCase mockPlayerUseCase;
    late PlayerController cubit;

    setUp(() {
      mockPlayerUseCase = MockPlayerUseCase();
      cubit = PlayerController(playerUseCase: mockPlayerUseCase);
    });

    const mockPlayer = Player(name: 'Bob');

    group('setPlayer', () {
      blocTest<PlayerController, PlayerState>(
        'emits correct new state when setPlayer is called with new player',
        build: () => cubit,
        act: (cubit) => cubit.setPlayer(name: mockPlayer.name),
        expect: () => [
          const PlayerState(player: mockPlayer, saved: false),
        ],
      );

      blocTest<PlayerController, PlayerState>(
        'emits new state when setPlayer is same as previous',
        build: () {
          cubit.setPlayer(name: mockPlayer.name);
          return cubit;
        },
        act: (cubit) => cubit.setPlayer(name: mockPlayer.name),
        expect: () => [
          const PlayerState(player: mockPlayer, saved: true),
        ],
      );
    });

    group('savePlayer', () {
      blocTest<PlayerController, PlayerState>(
        'emits saved state when savePlayer is successful',
        build: () {
          when(
            () => mockPlayerUseCase.savePlayer(player: mockPlayer),
          ).thenAnswer((_) async => true);
          cubit.setPlayer(name: mockPlayer.name);
          return cubit;
        },
        act: (cubit) async => cubit.savePlayer(),
        expect: () => [
          const PlayerState(player: mockPlayer, saved: true),
        ],
      );

      blocTest<PlayerController, PlayerState>(
        'does not emit saved state when savePlayer fails',
        build: () {
          when(
            () => mockPlayerUseCase.savePlayer(player: mockPlayer),
          ).thenAnswer((_) async => false);
          cubit.setPlayer(name: mockPlayer.name);
          return cubit;
        },
        act: (cubit) async => cubit.savePlayer(),
        expect: () => <PlayerState>[],
      );

      blocTest<PlayerController, PlayerState>(
        'does not emit saved state when player has empty name',
        build: () {
          cubit.setPlayer(name: '');
          return cubit;
        },
        act: (cubit) async => cubit.savePlayer(),
        expect: () => <PlayerState>[],
      );

      blocTest<PlayerController, PlayerState>(
        'does not emit saved state when player is null',
        build: () => cubit,
        act: (cubit) async => cubit.savePlayer(),
        expect: () => <PlayerState>[],
      );
    });

    group('deletePlayer', () {
      blocTest<PlayerController, PlayerState>(
        'emits initial state when deletePlayer is successful',
        build: () {
          when(
            () => mockPlayerUseCase.deletePlayer(),
          ).thenAnswer((_) async => true);
          cubit.setPlayer(name: mockPlayer.name);
          return cubit;
        },
        act: (cubit) async => cubit.deletePlayer(),
        expect: () => [
          PlayerState.initial(),
        ],
      );

      blocTest<PlayerController, PlayerState>(
        'emits no state state when deletePlayer is not successful',
        build: () {
          when(
            () => mockPlayerUseCase.deletePlayer(),
          ).thenAnswer((_) async => false);
          cubit.setPlayer(name: mockPlayer.name);
          return cubit;
        },
        act: (cubit) async => cubit.deletePlayer(),
        expect: () => <PlayerState>[],
      );
    });

    group('loadPlayer', () {
      blocTest<PlayerController, PlayerState>(
        'emits loaded state when loadPlayer returns a player',
        build: () {
          when(() => mockPlayerUseCase.loadPlayer()).thenReturn(mockPlayer);
          return cubit;
        },
        act: (cubit) => cubit.loadPlayer(),
        expect: () => [
          const PlayerState(player: mockPlayer, saved: true),
        ],
      );

      blocTest<PlayerController, PlayerState>(
        'emits state with null player when loadPlayer returns null',
        build: () {
          when(() => mockPlayerUseCase.loadPlayer()).thenReturn(null);
          return cubit;
        },
        act: (cubit) => cubit.loadPlayer(),
        expect: () => <PlayerState>[],
      );
    });
  });
}
