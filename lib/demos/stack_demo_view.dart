import 'dart:math';

import 'package:flutter/material.dart';

import '../core/random_image.dart';


class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: RandomImage(),
                    bottom: 25,
                  ),
                  Positioned(
                      height: 50,
                      bottom: 0,
                      width: 200,
                      child: SizedBox(
                        width: 200,
                        child: _card(),
                      ))
                ],
              )),
          Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _card() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
