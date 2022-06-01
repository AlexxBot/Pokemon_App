import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failures.dart';

import '../entities/pokemon.dart';
import '../repository/pokemon_repository.dart';

abstract class UseCase {
  Future<Either<Failure, List<Pokemon>>> getList();
}

class PokemonUseCase implements UseCase {
  final PokemonRepository repository;

  PokemonUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Pokemon>>> getList() async {
    return await repository.getList();
  }
}
