import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/chip_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/move.dart';

class MovesWidget extends StatelessWidget {
  final List<Move> moves;
  final Color? color;
  const MovesWidget({Key? key, required this.moves, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: vspaceL, horizontal: hspaceL),
      color: Colors.white,
      child: ListView(
        children: [
          Wrap(
            children: moves
                .map<ChipWidget>((move) => ChipWidget(
                      hPadding: hspaceS,
                      vPadding: vspaceS,
                      text: move.name ?? '',
                      fontSize: fontSizeM,
                      color: color,
                      textColor: Colors.black,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
