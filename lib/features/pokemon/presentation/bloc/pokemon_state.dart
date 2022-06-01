part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class LoadingState extends PokemonState {}

class PokemonsListedState extends PokemonState {
  final List<Pokemon> pokemons;
  const PokemonsListedState({required this.pokemons});
}

class ErrorState extends PokemonState {
  final String message;
  const ErrorState({this.message = ''});
}
