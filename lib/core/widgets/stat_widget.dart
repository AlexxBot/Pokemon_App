import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/utils/regular_expresion.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';

class StatWidget extends StatelessWidget {
  final int min;
  final int max;
  final String name;
  final double value;
  final Color? color;
  const StatWidget(
      {Key? key,
      this.min = 0,
      this.max = 200,
      required this.name,
      required this.value,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: vspaceM, right: 0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextWidget(name,
                color: Theme.of(context).primaryColor.withOpacity(0.7)),
          ),
          Expanded(
              child: TextWidget(
            value.toStringAsFixed(0),
            color: Theme.of(context).primaryColor,
            textAlign: TextAlign.right,
            fontWeight: fontWeightBold,
          )),
          Expanded(
            flex: 5,
            child: Slider(
                inactiveColor: Colors.grey,
                activeColor: color,
                min: min * 1.0,
                max: max * 1.0,
                value: value,
                onChanged: (value) => {}),
            /* CupertinoSlider(
                //inactiveColor: Colors.grey,
                activeColor: color,
                min: min * 1.0,
                max: max * 1.0,
                value: value,
                onChanged: null,
              ) */
          )
        ],
      ),
    );
  }
}
