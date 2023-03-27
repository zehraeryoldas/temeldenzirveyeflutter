import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key, this.height = 100}) : super(key: key);

  final ImageUrl = "https://picsum.photos/200/300";
  //random image ise height da dışarıdan gelmeli
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ImageUrl,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
