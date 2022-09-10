import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String pathImage;
  final double? percentageWidth;

  const ImageScreen({
    Key? key,
    required this.pathImage,
    this.percentageWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Image(
      image: AssetImage(pathImage),
      fit: BoxFit.contain,
      width: width * (percentageWidth ?? 0.5),
    );
  }
}
