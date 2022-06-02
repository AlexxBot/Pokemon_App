import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/chip_widget.dart';
import 'package:pokemon_app/core/widgets/image_widget.dart';
import 'package:pokemon_app/core/widgets/svg_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/types.dart';
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
        child: Container(
          padding: const EdgeInsets.all(vspaceS),
          decoration: BoxDecoration(
              color: TypesColors.getColor(pokemon.detail!.types[0]),
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadiusInput))),
          child: Stack(children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  //fit: BoxFit.cover,
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/pok.png'),
                ),
              )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(vspaceM),
                child: SvgWidget(
                  height: 100,
                  //width: auto,
                  //type: pokemon.detail!.types[0],
                  imageUrl: pokemon.detail!.sprites!.dreamWorld,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: TextWidget(
                pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                fontWeight: fontWeightBold,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.vertical,
                children: pokemon.detail!.types
                    .map<ChipWidget>((type) => ChipWidget(
                          text: type,
                          color: TypesColors.getColor(pokemon.detail!.types[0]),
                          fontSize: fontSizeS - 2,
                        ))
                    .toList(),
              ),
            )

            //Text(widget.pokemon.url)
          ]),
        ));
  }
}
