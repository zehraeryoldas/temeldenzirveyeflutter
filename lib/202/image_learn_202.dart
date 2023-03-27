import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //Image.asset('.../assets/png/deniz_feneri.png'),
          //Image.asset(ImagePaths.deniz_feneri
          //  .path()), //teknik olarak daha temiz kod yazıyoruz.
          ImagePaths.deniz_feneri.toWidget(height: 200),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  deniz_feneri
}

extension ImagePathExtension on ImagePaths {
  String path() {
    return 'assets/$name.png';
  }

  //eğer imagelerimiz aynı ise bu widget fonksiyonunu kullanıyoruz

  Widget toWidget({double height = 24}) {
    //burada default olarak 24 verdik.

    return Image.asset(
      path(),
      height: height,
    );
  }
}
