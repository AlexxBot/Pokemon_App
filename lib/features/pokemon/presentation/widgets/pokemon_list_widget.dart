import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_item_widget.dart';

class PokemonListWidget extends StatelessWidget {
  final List<Pokemon> pokemons;
  const PokemonListWidget({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
          cacheExtent: 100,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              vertical: vspaceM, horizontal: hspaceM),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 200,
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext ctx, index) {
            return PokemonItemWidget(
              pokemon: pokemons[index],
            );
          }),
    );
  }
}
