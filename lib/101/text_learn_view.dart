// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key}) : super(key: key);

  final String name = 'Veli';

  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CupertinoButton(child: Text('a'), onPressed: () {}),
            //TextButton(onPressed: () {}, child: Text('a')),
            Text(
              ('welcome $name ${name.length}'), //name.length ile fonksiyon oluşturduk

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              textScaleFactor: 1, //index
              style: TextStyle(
                  wordSpacing: 2,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                  height: 5,
                  color: Colors.lime,
                  letterSpacing: 2, //harf boşluğu
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              ('hello $name ${name.length}'), //name.length ile fonksiyon oluşturduk
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              textScaleFactor: 1, //index
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              ('hello $name ${name.length}'), //name.length ile fonksiyon oluşturduk
              maxLines: 2,
              //overflow: TextOverflow.ellipsis, //sona üç nokta
              textAlign: TextAlign.right,
              textScaleFactor: 1, //index
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: ProjectColors.welcomeColor),
            ),
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      height: 24,
      color: Colors.lime,
      letterSpacing: 2, //harf boşluğu
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = " Merhaba";
}
