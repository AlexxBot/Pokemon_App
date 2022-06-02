import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_app/core/global/size_constants.dart';

class SvgWidget extends StatefulWidget {
  final String? imageUrl;
  final double scale;
  final double height;
  final double width;
  final bool withshadow;
  const SvgWidget(
      {Key? key,
      this.imageUrl,
      this.scale = 1,
      required this.height,
      required this.width,
      this.withshadow = true})
      : super(key: key);

  @override
  State<SvgWidget> createState() => _SvgWidgetState();
}

class _SvgWidgetState extends State<SvgWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.imageUrl == null
        ? const SizedBox(
            height: 200,
            width: 0,
          )
        : Container(
            padding: const EdgeInsets.symmetric(
                vertical: vspaceS, horizontal: hspaceM),
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                boxShadow: [
                  if (widget.imageUrl != null && widget.withshadow)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                ],
                /* image: (widget.imageUrl != null && widget.imageUrl != '')
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: SvgPicture.network(
                          widget.imageUrl!,
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: const CircularProgressIndicator()),
                        ))
                    : const DecorationImage(
                        opacity: 0.1,
                        //fit: BoxFit.cover,
                        image: AssetImage('assets/images/pokeball.png'),
                      ), */
                borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadiusInput))),
            child: SvgPicture.network(
              widget.imageUrl!,
              placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator()),
            ),
          );
  }
}
