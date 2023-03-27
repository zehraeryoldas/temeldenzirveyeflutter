import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../101/icon_learn.dart';
import '../101/image_learn.dart';


class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double notcMargin = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: _MyTabsView.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabsView.values.length,
        child: Scaffold(
          extendBody: true, //yüzen butonun arka plana geçmesini sağlar
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabsView
                .home.index); //bu kontrol ile yüzen buton home sayfasına gider
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin:
                notcMargin, //yüzen butonun alt menuden ne kadar uzaklaştığını anlatır.
            child: TabBar(
                labelColor: Colors.red,
                controller: _tabController,
                onTap: (int index) {},
                tabs: _MyTabsView.values
                    .map((e) => Tab(
                          text: '${e.name}',
                        ))
                    .toList()),
          ),
          appBar: AppBar(),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                imageLearn(),
                IconLearnView(),
                imageLearn(),
                IconLearnView()
              ]),
        ));
  }
}

enum _MyTabsView { home, settings, favorite, profile }
