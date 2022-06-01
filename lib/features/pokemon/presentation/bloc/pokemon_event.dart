part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetListPokemonsEvent extends PokemonEvent {}

class GetPokemonDetailEvent extends PokemonEvent {
  final String pokemonUrl;
  const GetPokemonDetailEvent({required this.pokemonUrl});
}

class GetPokemonFormEvent extends PokemonEvent {
  final String pokemonUrl;
  const GetPokemonFormEvent({required this.pokemonUrl});
}
