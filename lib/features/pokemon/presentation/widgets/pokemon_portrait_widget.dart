import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/svg_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';

class PokemonPortratWidget extends StatelessWidget {
  final PokemonDetail detail;
  const PokemonPortratWidget({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(vspaceS),
          child: TextWidget(
            detail.name,
            fontSize: fontSizeXL * 2,
            fontWeight: fontWeightBold,
          ),
        ),
        Wrap(
          children: detail.types
              .map<Padding>((type) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: hspaceS),
                  child: Chip(
                    padding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: hspaceS),
                    label: Text(type),
                  )))
              .toList(),
        ),
        Align(
          alignment: Alignment.center,
          child: SvgWidget(height: 200, imageUrl: detail.sprites!.dreamWorld!),
        ),
      ]),
    );
  }
}
