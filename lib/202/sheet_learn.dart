import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //ekrana haber vermek için bu yöntemi kullanıyoruz.
          final result = await showModalBottomSheet(
              //showmodalbottomsheet kapandığında gelen sonucu kontrol edebileceğim if ile.
              backgroundColor: backgroundColor,
              barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              isScrollControlled: true,

              //useSafeArea: true,
              context: context,
              builder: (context) {
                // FractionallySizedBox(
                //   heightFactor: MediaQuery.of(context).size.height,
                // );
                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: _customSheet(backgroundColor: backgroundColor));
              });

          inspect(result);
          //sheet kapandığında gelen sonucu kontrol etmek için bunu yazdık.
          if (result is bool) {
            setState(() {
              backgroundColor = Colors.cyan;
            });
          }
        },
        child: Icon(Icons.share),
      ),
    );
  }
}

class _customSheet extends StatefulWidget {
  const _customSheet({
    super.key,
    required Color backgroundColor,
  });

  @override
  State<_customSheet> createState() => _customSheetState();
}

class _customSheetState extends State<_customSheet> {
  Color _backgroundColor = Colors.blue;
  final _grpHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _grpHeight,
              child: Stack(children: [
                Divider(
                  thickness: 3,
                  color: Colors.yellow,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
                Positioned(
                    right: 10,
                    top: 0,
                    height: 24,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ),
                    ))
              ]),
            ),
            Text("Data22"),
            Image.network(
              "https://media.istockphoto.com/id/1023364994/tr/foto%C4%9Fraf/uv-portre-kadar-kapat%C4%B1n.webp?s=612x612&w=is&k=20&c=503ijRsIGh1uTwKqrqQ97wU58YaBUePSuuOUsFfHNMw=",
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.amber;
                  });
                  Navigator.of(context).pop<bool>(true);
                  //Navigator.of(context).pop();
                  // setState(() { .  onpressed içerisinde bir şey olunca extract widget yapamıyoruz.
                  //   backgroundColor = Colors.red;
                  // });
                },
                child: Text("Ok"))
          ],
        ),
      ),
    );
  }
}
