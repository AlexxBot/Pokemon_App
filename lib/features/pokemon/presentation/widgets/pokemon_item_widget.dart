import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/widgets/image_widget.dart';
import 'package:pokemon_app/core/widgets/svg_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/pages/pokemon_detail_page.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItemWidget({Key? key, required this.pokemon}) : super(key: key);

  Future<void> _showDetail(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PokemonDetailPage(detail: pokemon.detail!)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _showDetail(context),
        child: Stack(children: [
          /* ImageWidget(
            height: 150,
            width: 150,
            imageUrl: pokemon.detail!.sprites!.frontDefault,
          ), */
          SvgWidget(
            height: 150,
            width: 150,
            imageUrl: pokemon.detail!.sprites!.dreamWorld,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(pokemon.name),
          )

          //Text(widget.pokemon.url)
        ]));
  }
}
