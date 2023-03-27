import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);

  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Column(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: Theme.of(context).backgroundColor,
              size: 40,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: 40,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: Colors.purple,
              size: iconSizes.iconSmall,
            )),
      ]),
    );
  }
}

class IconSizes {
  final double iconSmall = 60;
}

class IconColors {
  final Color froly = Color(0xffED617A);
}
