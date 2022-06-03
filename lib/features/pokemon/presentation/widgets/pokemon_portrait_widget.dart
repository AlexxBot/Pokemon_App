import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/chip_widget.dart';
import 'package:pokemon_app/core/widgets/svg_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/types.dart';

class PokemonPortratWidget extends StatelessWidget {
  final PokemonDetail detail;
  const PokemonPortratWidget({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.1,
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/pok.png'),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(vspaceS),
          child: Wrap(
              children: detail.types
                  .map<ChipWidget>((type) => ChipWidget(
                        text: type,
                        fontSize: fontSizeL,
                        color: TypesColors.getColor(detail.types[0]),
                        vPadding: vspaceS,
                        hPadding: vspaceM,
                      ))
                  .toList()),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgWidget(
                  height: MediaQuery.of(context).size.width - 120,
                  imageUrl: detail.sprites!.dreamWorld!),
            ),
          ],
        ),
      ]),
    );
  }
}
