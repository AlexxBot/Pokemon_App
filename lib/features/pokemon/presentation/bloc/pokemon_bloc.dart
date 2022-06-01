import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/usecases/pokemon_use_case.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUseCase pokemonUseCase;
  PokemonBloc({required this.pokemonUseCase}) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is GetListPokemonsEvent) {
        emit(LoadingState());
        final response = await pokemonUseCase.getList();
        response.fold((failure) => emit(ErrorState(message: failure.message)),
            (pokemons) => emit(PokemonsListedState(pokemons: pokemons)));
      }
    });
  }
}
