import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/image_widget.dart';
import 'package:pokemon_app/core/widgets/text_pair_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';

class FormsWidget extends StatelessWidget {
  final Sprites sprites;
  const FormsWidget({Key? key, required this.sprites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.symmetric(vertical: vspaceL, horizontal: hspaceL),
        color: Colors.white,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 100,
              maxCrossAxisExtent: 100,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
          children: [
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.backDefault,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.backFemale,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.backShiny,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.backShinyFemale,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.frontDefault,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.frontFemale,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.frontShiny,
            ),
            ImageWidget(
              height: 100,
              width: 100,
              imageUrl: sprites.frontShinyFemale,
            ),
          ],
        ));
  }
}
