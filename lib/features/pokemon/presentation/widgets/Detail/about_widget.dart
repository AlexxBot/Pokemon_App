import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_pair_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';

class AboutWidget extends StatelessWidget {
  final PokemonDetail detail;
  const AboutWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final realHeigth = (detail.height ?? 1) / 10.0;
    final realWeigth = (detail.weight ?? 1) / 10.0;
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: vspaceL, horizontal: hspaceL),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPairWidget(name: 'Height', value: '$realHeigth cm'),
          TextPairWidget(name: 'Weight', value: '$realWeigth kg'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: vspaceL, horizontal: 0),
            child: TextWidget(
              'Abilities',
              color: Colors.black,
              fontSize: fontSizeXL,
              fontWeight: fontWeightBold,
            ),
          ),
          Wrap(
            children: detail.abilities
                .map<Padding>((ability) => Padding(
                      padding: const EdgeInsets.all(vspaceS),
                      child: Chip(
                          label: TextWidget(
                        ability,
                        color: Colors.black,
                      )),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
