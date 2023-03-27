// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:temeldenzirveyeflutter/product/navigator/navigator_routes.dart';

import '../../product/mixin/navigator_mixin.dart';


class navigatorHomeView extends StatefulWidget {
  const navigatorHomeView({super.key});

  @override
  State<navigatorHomeView> createState() => _navigatorHomeViewState();
}

class _navigatorHomeViewState extends State<navigatorHomeView>
    with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.abc_rounded),
          onPressed: () async {
            // Navigator.of(context)
            //     .pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");

            //navigatormanager de context olmasın diye bir kod yazmıştık şimdi alttaki contextli yapıyı kapatıp manageri yazacağız
            //context olmayınca bir senaryoda diyelim bir classta bir data geldi ve buraya gitmek istiyor bu singelton sayesinde de
            //datayı en baştan initialize ettim ve key verdiğim için de ben sayfanın navigationuna karışabiliyorum
            //
            //router=NavigatorManager.instance
            router.pushToPage(NavigateRoutes.detail, arguments: "VB10");
            // await NavigatorManager.instance
            //     .pushToPage(NavigateRoutes.detail, arguments: "VB10");
            // Navigator.of(context)
            //     .pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");
          }),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
