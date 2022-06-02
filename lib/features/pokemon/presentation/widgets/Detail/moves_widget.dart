import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/move.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/stat.dart';

class MovesWidget extends StatelessWidget {
  final List<Move> moves;
  const MovesWidget({Key? key, required this.moves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: vspaceL, horizontal: hspaceL),
      color: Colors.white,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: moves
                .map<Padding>((move) => Padding(
                      padding: const EdgeInsets.all(vspaceS),
                      child: Chip(
                          label: TextWidget(
                        move.name!,
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
