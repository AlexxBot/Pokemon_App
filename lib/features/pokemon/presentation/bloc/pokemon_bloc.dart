import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemons.dart';
import 'package:pokemon_app/features/pokemon/domain/usecases/pokemon_use_case.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUseCase pokemonUseCase;
  PokemonBloc({required this.pokemonUseCase}) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is GetListPokemonsEvent) {
        emit(LoadingState());
        final response = await pokemonUseCase.getList(event.url);
        response.fold((failure) => emit(ErrorState(message: failure.message)),
            (pokemons) => emit(PokemonsListedState(pokemons: pokemons)));
      }

      if (event is GetPokemonDetailEvent) {
        emit(LoadingState());
        final response = await pokemonUseCase.getPokemon(event.pokemonUrl);
        response.fold((failure) => emit(ErrorState(message: failure.message)),
            (pokemon) => emit(PokemonRetrivedState(pokemon: pokemon)));
      }

      if (event is GetPokemonFormEvent) {
        emit(LoadingImageState(imageUrl: event.pokemonUrl));
        final response = await pokemonUseCase.getPokemonForm(event.pokemonUrl);
        response.fold(
            (failure) => emit(ErrorState(message: failure.message)),
            (pokemonForm) => emit(PokemonFormRetrivedState(
                url: event.pokemonUrl, pokemonForm: pokemonForm)));
      }
    });
  }
}
