import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_pair_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';

class AboutWidget extends StatelessWidget {
  final PokemonDetail detail;
  const AboutWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final realHeigth = (detail.height ?? 1) * 10;
    final realWeigth = (detail.weight ?? 1) / 10.0;
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: vspaceL, horizontal: hspaceL),
      color: Colors.white,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPairWidget(name: 'Height', value: '$realHeigth cm'),
          TextPairWidget(name: 'Weight', value: '$realWeigth kg'),
          TextPairWidget(
              name: 'Base Experience',
              value: (detail.baseExperience ?? 0).toString()),
          TextPairWidget(name: 'Specie', value: detail.specie ?? ''),
          TextPairWidget(
              name: 'Abilities',
              value: detail.abilities
                  .reduce((acc, ability) => acc += ', ' + ability)),
        ],
      ),
    );
  }
}
