import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failures.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemons.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemons>> getList(String? url);
  Future<Either<Failure, PokemonDetail>> getPokemon(String url);
  Future<Either<Failure, PokemonForm>> getPokemonForm(String url);
}
