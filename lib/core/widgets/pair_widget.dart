import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';

class PairWidget extends StatelessWidget {
  final int min;
  final int max;
  final String name;
  final double value;
  const PairWidget(
      {Key? key,
      this.min = 0,
      this.max = 100,
      required this.name,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(vspaceS),
      child: Row(
        children: [
          Expanded(child: TextWidget(name, color: Colors.grey)),
          Expanded(
            flex: 2,
            child: Slider(
                min: min * 1.0,
                max: max * 1.0,
                value: value,
                onChanged: (value) => {}),
          )
        ],
      ),
    );
  }
}
