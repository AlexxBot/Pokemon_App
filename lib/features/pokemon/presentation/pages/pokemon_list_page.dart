import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/widgets/snack_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final PokemonBloc pokemonBloc;
  late List<Pokemon> pokemons;

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemons = [];
    pokemonBloc.add(GetListPokemonsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            if (state is LoadingState) return const CircularProgressIndicator();
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pokemons[index].name),
                );
              },
              itemCount: pokemons.length,
            );
          }),
        ),
      ) /* SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.greenAccent,
          )
        ])), */
          ),
    );
  }
}
