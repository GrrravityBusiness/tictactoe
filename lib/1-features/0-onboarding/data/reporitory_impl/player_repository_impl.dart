import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/0-onboarding/data/datasource/local_player_datasource.dart';
import 'package:tictactoe/1-features/0-onboarding/data/dto/player_dto.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/repositories/player_repository.dart';
import 'package:tictactoe/core/utils/failures.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  PlayerRepositoryImpl({
    required LocalPlayerDatasource localPlayerDatasource,
  }) : _localPlayerDatasource = localPlayerDatasource;

  final LocalPlayerDatasource _localPlayerDatasource;

  @override
  /// Deletes the player data from local storage, returns a [Failure]
  /// on error or a [bool] indicating success.
  Future<Either<Failure, bool>> deletePlayer() async =>
      _localPlayerDatasource.deletePlayer();

  @override
  /// Loads the player data from local storage, returns a [Failure]
  /// on error or a [Player?] indicating the loaded player or null if not found.
  Either<Failure, Player?> loadPlayer() {
    final playerOrFailure = _localPlayerDatasource.loadPlayer();
    return playerOrFailure.bind((dto) => Right(dto?.toEntity));
  }

  @override
  /// Saves the player data to local storage, returns a [Failure] on error or
  /// a [bool] indicating success.
  Future<Either<Failure, bool>> savePlayer({required Player player}) async {
    return _localPlayerDatasource.savePlayer(playerDTO: player.toDTO);
  }
}
