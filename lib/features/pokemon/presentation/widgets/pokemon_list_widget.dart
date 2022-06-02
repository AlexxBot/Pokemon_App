import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_config.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemons.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/pokemon_item_widget.dart';

class PokemonListWidget extends StatelessWidget {
  final List<Pokemon> list;
  final ScrollController controller;
  final int maxCount;
  final VoidCallback? getMoreData;
  const PokemonListWidget(
      {Key? key,
      required this.list,
      required this.controller,
      required this.maxCount,
      this.getMoreData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final size = SizeConfig()..init(context);
    final double cardWidth = MediaQuery.of(context).size.width;
    return Scrollbar(
      child: GridView.builder(
          controller: controller,
          addAutomaticKeepAlives: true,
          cacheExtent: 100,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              vertical: vspaceM, horizontal: hspaceM),
          gridDelegate: /* SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200,
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.8),
            ), */
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 150,
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 5 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
          /* SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 200,
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10), */
          itemCount: list.length < maxCount ? list.length + 1 : list.length,
          itemBuilder: (BuildContext ctx, index) {
            if (index == list.length) {
              return const CupertinoActivityIndicator();
            }
            return Center(
              child: PokemonItemWidget(
                pokemon: list[index],
              ),
            );
          }),
    );
  }
}
