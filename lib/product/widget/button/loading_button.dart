import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton(
      {super.key, required this.title, required this.onpressed});
  //adam bize bir string title yollasın yani ben ne yazacam childa o belirlesin
  final String title;

  //adam tıklamayı geri verebilmek için
  final Future<void> Function() onpressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        //eğer adam isloading sırasında ise return atalım basamasın
        if (_isLoading) return;
        _changeLoading();
        await widget.onpressed.call(); //yani adamın requestini bekliyorum
        _changeLoading(); //ve ardından adama haber veriyorum
      },
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(widget.title), //diyerek bunu adamdan almış oldum
    );
  }
}
