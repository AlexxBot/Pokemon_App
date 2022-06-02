import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatefulWidget {
  final String? imageUrl;
  final double height;
  final bool withshadow;

  const SvgWidget(
      {Key? key, this.imageUrl, required this.height, this.withshadow = true})
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.network(
        widget.imageUrl!,
        placeholderBuilder: (BuildContext context) => Container(
            width: widget.height,
            //height: widget.height,
            padding: const EdgeInsets.all(0.0),
            child: const CupertinoActivityIndicator()),
      ),
    );
  }
}
