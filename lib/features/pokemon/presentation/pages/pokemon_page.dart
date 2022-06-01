import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/widgets/snack_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_list_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late final PokemonBloc pokemonBloc;
  late List<Pokemon> pokemons;

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemons = [];
    pokemonBloc.add(GetListPokemonsEvent());
  }

  Future<void> _reloadList() async {
    pokemonBloc.add(GetListPokemonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: SafeArea(
          child: BlocListener<PokemonBloc, PokemonState>(
        bloc: pokemonBloc,
        listener: (context, state) {
          if (state is ErrorState) {
            SnackWidget.showMessage(context, state.message);
          }
          if (state is PokemonsListedState) {
            pokemons = state.pokemons;
          }
        },
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: ((context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
                onRefresh: _reloadList,
                child: PokemonListWidget(pokemons: pokemons));
          }),
        ),
      )),
    );
  }
}
