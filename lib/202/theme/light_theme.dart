import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData themeData;
  LightTheme() {
    themeData = ThemeData(
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.pink),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: BorderSide(color: Colors.black)),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onPrimary: Colors.red, onSecondary: _lightColor.blueMenia)),
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  //bunu proje içinde çağırmamam gerekiyor.
  final Color _textColor = Color.fromARGB(255, 27, 25, 25);
  final Color blueMenia = Color.fromARGB(95, 188, 248, 1);
}
