import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CenterCircularRedProgres()],
      ),
      /*body: Center(
        child: CenterCircularRedProgres(),
      ),*/
      body: Center(
          child:
              LinearProgressIndicator()), //bu indicator ile yatayda loading gösteriliyor
    );
  }
}

class CenterCircularRedProgres extends StatelessWidget {
  const CenterCircularRedProgres({
    Key? key,
  }) : super(key: key);
  final redColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 10, //loadingin kalınlığını ayarlıyor
      //value: 0.4, //bunu yazarak loadingin hızını ayarlıyoruz.
      backgroundColor: Colors.white,
    ));
  }
}
