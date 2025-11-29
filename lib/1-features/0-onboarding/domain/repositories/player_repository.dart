import 'package:dartz/dartz.dart';
import 'package:tictactoe/1-features/0-onboarding/domain/entities/player.dart';
import 'package:tictactoe/core/utils/failures.dart';

abstract class PlayerRepository {
  /// Deletes the player data from local storage, returns a [Failure]
  /// on error or a [bool] indicating success.
  Future<Either<Failure, bool>> savePlayer({required Player player});

  /// Loads the player data from local storage, returns a [Failure]
  /// on error or a [Player?] indicating the loaded player or null if not found.
  Either<Failure, Player?> loadPlayer();

  /// Saves the player data to local storage, returns a [Failure] on error or
  /// a [bool] indicating success.
  Future<Either<Failure, bool>> deletePlayer();
}
