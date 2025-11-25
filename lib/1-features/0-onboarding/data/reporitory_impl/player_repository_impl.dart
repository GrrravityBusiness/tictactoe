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
  Future<Either<Failure, bool>> deletePlayer() async =>
      _localPlayerDatasource.deletePlayer();

  @override
  Player? loadPlayer() {
    final playerDTO = _localPlayerDatasource.loadPlayer();
    return playerDTO?.toEntity;
  }

  @override
  Future<Either<Failure, bool>> savePlayer({required Player player}) async {
    return _localPlayerDatasource.savePlayer(playerDTO: player.toDTO);
  }
}
