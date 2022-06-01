import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failures.dart';

import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getList();
}
