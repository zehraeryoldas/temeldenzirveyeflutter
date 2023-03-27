// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/101/icon_learn.dart';
import 'package:temeldenzirveyeflutter/101/stack_learn.dart';

import 'image_learn.dart';


class pageViewLearn extends StatefulWidget {
  const pageViewLearn({Key? key}) : super(key: key);

  @override
  State<pageViewLearn> createState() => _pageViewLearnState();
}

class _pageViewLearnState extends State<pageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);

  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(_currentPageIndex.toString()),
        ),
        Spacer(),
        FloatingActionButton(
          onPressed: () {
            _pageController.previousPage(
                duration: _DurationUtility._durationLow,
                curve: Curves.slowMiddle);
          },
          child: Icon(Icons.chevron_left),
        ),
        FloatingActionButton(
          onPressed: () {
            _pageController.nextPage(
                duration: _DurationUtility._durationLow,
                curve: Curves.slowMiddle);
          },
          child: Icon(Icons.chevron_right),
        )
      ]),
      appBar: AppBar(),
      body: PageView(
        padEnds: false, //önizlemeyi sola dayalı yapar
        controller: _pageController, //ikinci sayfanın önizlemesini gösterir
        onPageChanged:
            _updatePageIndex, //datanın değişikliği hakkında bilgi veriyor.
        children: [
          imageLearn(),
          IconLearnView(),
          StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
