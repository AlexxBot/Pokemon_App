part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class LoadingState extends PokemonState {}

class PokemonsListedState extends PokemonState {
  final Pokemons pokemons;
  const PokemonsListedState({required this.pokemons});
}

/* class LoadingImageState extends PokemonState {
  final String imageUrl;
  const LoadingImageState({required this.imageUrl});
}

class PokemonRetrivedState extends PokemonState {
  final PokemonDetail pokemon;
  const PokemonRetrivedState({required this.pokemon});
}

class PokemonFormRetrivedState extends PokemonState {
  final String url;
  final PokemonForm pokemonForm;
  const PokemonFormRetrivedState(
      {required this.url, required this.pokemonForm});
} */

class ErrorState extends PokemonState {
  final String message;
  const ErrorState({this.message = ''});
}
