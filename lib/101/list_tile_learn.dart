// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  final ImageUrl = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  title: RandomImage(),
                  dense:
                      true, //componenti sıkıştırmaya yarıyor. kendi paddinglerini siliyor.
                  subtitle: Text("How do you use your card"),
                  leading: Icon(Icons.menu),
                  trailing: Container(
                      width: 50,
                      color: Colors.red,
                      child: SizedBox(
                          width: 20,
                          child: Icon(Icons.chevron_right))), //sağa ekler
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
