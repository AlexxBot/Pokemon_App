import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';

import '../entities/pokemon.dart';
import '../repository/pokemon_repository.dart';

abstract class UseCase {
  Future<Either<Failure, List<Pokemon>>> getList();
  Future<Either<Failure, PokemonDetail>> getPokemon(String url);
  Future<Either<Failure, PokemonForm>> getPokemonForm(String url);
}

class PokemonUseCase implements UseCase {
  final PokemonRepository repository;

  PokemonUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Pokemon>>> getList() async {
    return await repository.getList();
  }

  @override
  Future<Either<Failure, PokemonDetail>> getPokemon(String url) async {
    return await repository.getPokemon(url);
  }

  @override
  Future<Either<Failure, PokemonForm>> getPokemonForm(String url) async {
    final pokemonForm = await repository.getPokemonForm(url);
    return pokemonForm;
  }
}
