import 'package:flutter/material.dart';

class columnRowLearn extends StatelessWidget {
  const columnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4, //ile boyunu ayarlıyor
              child: Container(
                color: Colors.pink,
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.purple,
              )),
          Expanded(flex: 2, child: Container(color: Colors.deepOrange)),
          Expanded(
            flex: 2,
            child: FlutterLogo(),
          )
        ],
      ),
    );
  }
}
