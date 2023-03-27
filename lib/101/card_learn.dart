import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          card(),
          card(),
          card(),
          card(),
          Card(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}

class card extends StatelessWidget {
  card({
    Key? key,
  }) : super(key: key);

  final roundedrectangleborder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(80));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        width: 100,
      ),
    );
  }
}
