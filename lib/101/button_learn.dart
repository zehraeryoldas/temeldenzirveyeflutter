// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonLearn")),
      body: Column(children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'save',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          /* style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),*/

          style: ButtonStyle(
              //bu satırlar ile butonu beyaz ama tıklayınca yeşil yapabiliyoruz.
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            }
            return Colors.white;
          })),
        ),
        ElevatedButton(
            onPressed: null,
            child: Text("Data")), //arka planda rengi olan bir buton
        IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10)),
            onPressed: () {},
            child: Text(
                "z")), //bu butonun özelliği borderradius gibi bir çerçeve veriyor

        OutlinedButton.icon(
            onPressed: () {}, icon: Icon(Icons.camera), label: Text("Data")),
        InkWell(
          onTap: () {},
          child: Text("zehra"),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 40, left: 40),
              child: Text(
                "Place bid",
                style: Theme.of(context).textTheme.headline4,
              ),
            ))
      ]),
    );
  }
}
