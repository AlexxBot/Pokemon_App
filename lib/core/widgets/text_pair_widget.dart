import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';

class TextPairWidget extends StatelessWidget {
  final String name;
  final String value;
  final TextAlign? valueTextAlign;
  const TextPairWidget(
      {Key? key, required this.name, required this.value, this.valueTextAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: hspaceL, right: 0, bottom: vspaceXL, top: vspaceL),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextWidget(name,
                color: Theme.of(context).primaryColor.withOpacity(0.7)),
          ),
          Expanded(
              flex: 3,
              child: TextWidget(
                value,
                color: Theme.of(context).primaryColor,
                textAlign: valueTextAlign,
                fontWeight: fontWeightBold,
              )),
        ],
      ),
    );
  }
}
