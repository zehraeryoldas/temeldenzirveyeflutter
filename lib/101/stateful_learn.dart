import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/product/language/language_item.dart';

import '../product/counter_hello_buton.dart';


class statefulLearn extends StatefulWidget {
  const statefulLearn({Key? key}) : super(key: key);

  @override
  State<statefulLearn> createState() => _statefulLearnState();
}

class _statefulLearnState extends State<statefulLearn> {
  int _countValue = 0;
  int _counterCustom = 0;

  void _updateCounter(bool increment) {
    if (increment) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _increment(),
          _deincrement(),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            _countValue.toString(),
            style: Theme.of(context).textTheme.headline2,
          )),
          Placeholder(),
          counterHelloLearn(),
        ],
      ),
    );
  }

  FloatingActionButton _increment() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }

  Padding _deincrement() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}
