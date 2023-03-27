import 'dart:ui';

import 'package:flutter/material.dart';

class imageLearn extends StatelessWidget {
  const imageLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
              height: 330,
              width: 330,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg",
                fit: BoxFit.contain,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Image.network(
                "https://cdn.pixabay.com/photo/2017/08/23/17/15/blackberry-2673547_960_720.jpg"),
          )
        ],
      ),
    );
  }
}
