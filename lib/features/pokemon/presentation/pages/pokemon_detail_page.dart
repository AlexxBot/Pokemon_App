import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';

class PokemonDetailPage extends StatefulWidget {
  final String url;
  const PokemonDetailPage({Key? key, required this.url}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final PokemonBloc pokemonBloc;
  late PokemonDetail pokemon;

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemon = PokemonDetail(name: '');
    pokemonBloc.add(GetPokemonDetailEvent(pokemonUrl: widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                vertical: vspaceM, horizontal: hspaceM),
            child: BlocListener<PokemonBloc, PokemonState>(
              bloc: pokemonBloc,
              listener: ((context, state) {
                if (state is PokemonRetrivedState) {
                  pokemon = state.pokemon;
                }
              }),
              child: BlocBuilder<PokemonBloc, PokemonState>(
                bloc: pokemonBloc,
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(children: [
                    Row(children: [
                      Chip(label: Text('Heigth: ${pokemon.height ?? 0}')),
                      Chip(label: Text('Weigth: ${pokemon.weight ?? 0}'))
                    ]),
                  ]);
                },
              ),
            )),
      ),
    );
  }
}
