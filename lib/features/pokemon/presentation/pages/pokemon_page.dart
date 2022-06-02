import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/widgets/snack_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemons.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_list_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late final PokemonBloc pokemonBloc;
  late List<Pokemon> list;
  late Pokemons pokemons;
  late int count;
  late String? url;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    list = [];
    count = 0;
    /* pokemonBloc.add(const GetListPokemonsEvent()); */
    _reloadList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  Future<void> _reloadList() async {
    url = null;
    pokemonBloc.add(const GetListPokemonsEvent());
  }

  Future<void> _getMoreData() async {
    if (url != null) {
      pokemonBloc.add(GetListPokemonsEvent(url: url));
    }
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
            list.addAll(state.pokemons.list);
            count = state.pokemons.count;
            url = state.pokemons.next;
          }
        },
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: ((context, state) {
            if (state is LoadingState && url == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
                onRefresh: _reloadList,
                child: PokemonListWidget(
                  list: list,
                  controller: _scrollController,
                  maxCount: count,
                  getMoreData: _getMoreData,
                ));
          }),
        ),
      )),
    );
  }
}
