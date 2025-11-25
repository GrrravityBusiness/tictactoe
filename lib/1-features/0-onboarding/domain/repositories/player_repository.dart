import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class PlayerRepository {
  Future<Either<Failure, bool>> savePlayer({required Player player});
  Player? loadPlayer();
  Future<Either<Failure, bool>> deletePlayer();
}
