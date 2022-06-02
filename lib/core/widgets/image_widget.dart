import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';

class ImageWidget extends StatefulWidget {
  final String? imageUrl;
  final double scale;
  final double height;
  final double width;
  final bool showNull;
  final bool withshadow;
  const ImageWidget(
      {Key? key,
      this.imageUrl,
      this.scale = 1,
      required this.height,
      required this.width,
      this.showNull = true,
      this.withshadow = true})
      : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: vspaceS, horizontal: hspaceM),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          image: (widget.imageUrl != null && widget.imageUrl != '')
              ? DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.imageUrl!))
              : const DecorationImage(
                  opacity: 0.1,
                  image: AssetImage('assets/images/pok.png'),
                ),
          borderRadius:
              const BorderRadius.all(Radius.circular(borderRadiusInput))),
    );
  }
}
