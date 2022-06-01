import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/core/network/network_info.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImple extends PokemonRepository {
  final PokemonRemoteData remoteData;
  final NetworkInfo networkInfo;

  PokemonRepositoryImple({required this.remoteData, required this.networkInfo});
  @override
  Future<Either<Failure, List<Pokemon>>> getList() async {
    if (await networkInfo.isConnected) {
      try {
        final pokemons = await remoteData.getList();
        return Right(pokemons);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(message: m.message));
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure(message: ex.toString()));
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
