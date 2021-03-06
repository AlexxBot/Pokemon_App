import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/image_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
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
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: vspaceM),
              child: TextWidget(
                'Default',
                color: Colors.black,
                fontSize: fontSizeXL,
                fontWeight: fontWeightBold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontDefault,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backDefault,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontShiny,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backShiny,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: vspaceM),
              child: TextWidget(
                'Female',
                color: Colors.black,
                fontSize: fontSizeXL,
                fontWeight: fontWeightBold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontShinyFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backShinyFemale,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
