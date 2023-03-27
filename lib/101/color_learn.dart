import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context)
            .errorColor, //bu sayede başka bir tema geldiğinde projeye bu error colora kullanıcı ne vermiş ise o olur. 3. video son dakikalar

        child: Text(
          "data",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}

class ColorsItems {
  static final Color porchase = Color(0xffEDBF61);
  static Color sulu = Color.fromARGB(198, 237, 97, 1);
}
