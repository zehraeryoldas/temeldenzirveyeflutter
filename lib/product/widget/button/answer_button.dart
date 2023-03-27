import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onNumber});
  //final void Function(int number)? onNumber;
  //hadi bool yapalım bu fonksiyonu
  final bool Function(int number)? onNumber;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  //random bir sayı dön bana ben bu random sayıyı inceleyip sana dönücem
  //ve bu verdiğim cevaba göre butonun rengini değiştir.
  //eğer doğru ise yeşil değilse kırmızı olsun.
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _backgroundColor),
      onPressed: () {
        //bunu müşteriye geri vermek için yukarıdaki functionu tanımlayacağız.
        //Random().nextInt(10);
        //(veli bacık part of videosu)
        final result = Random().nextInt(10);
        final response = widget.onNumber?.call(result) ?? false;
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.red;
        });
      },
      child: Text("data"),
    );
  }
}
