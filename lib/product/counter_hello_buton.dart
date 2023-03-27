import 'package:flutter/material.dart';

import 'language/language_item.dart';

class counterHelloLearn extends StatefulWidget {
  const counterHelloLearn({Key? key}) : super(key: key);

  @override
  State<counterHelloLearn> createState() => _counterHelloLearnState();
}

class _counterHelloLearnState extends State<counterHelloLearn> {
  int _counterCustom = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateCounter,
        child: Text("$_welcomeTitle $_counterCustom"));
  }
}
