import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';

class ChipWidget extends StatelessWidget {
  final Color? color;
  final double fontSize;
  final String text;
  final double vPadding;
  final double hPadding;
  final Color? textColor;
  const ChipWidget(
      {Key? key,
      this.color,
      this.fontSize = fontSizeS,
      required this.text,
      this.vPadding = vspaceS / 2,
      this.hPadding = hspaceS,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(borderRadiusInput)),
      margin:
          EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding / 2),
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: TextWidget(
        text,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
