import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';

class TextPairWidget extends StatelessWidget {
  final String name;
  final String value;
  const TextPairWidget({Key? key, required this.name, required this.value})
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
            child: TextWidget(
              value,
              fontSize: fontSizeM,
              //fontWeight: fontWeightBold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
