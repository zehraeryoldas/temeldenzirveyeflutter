// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showAboutDialog(
        //     context: context, applicationName: 'VB', children: [Text("data")]);
        final response = await showDialog(
            //barrierDismissible:
            //  false, //bu sayede alertdialog dışındaki alanlara basılınca kapanma özelliğini pasifleştiriyoruz.
            context: context,
            builder: (context) {
              // return UpdateDialog(
              //   context: context,
              // );
              return _ImageZoomDialog();
            });
        inspect(response);
      }),
    );
  }
}

// ignore: unused_element
// class _UpdateDialog extends StatelessWidget {
//   //burada önemli olan propertyleri verip işlemleri burada yapmak. //oldu veya olmadı
//   const _UpdateDialog({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Version Update"),
//       actions: [
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(
//                   context, true); //update basınca true değerini döndürebiliriz.
//             },
//             child: Text("Update")),
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("Close"))
//       ],
//     );
//   }
// }

class Keys {
  static const versionUpdate = 'Version Update';
}

//projeye logic katalım zehir bilgi???

class UpdateDialog extends AlertDialog {
  //bu sayede aslında yeni bir stateleswidget yapıp
  //yeni bir build metodu yapmak yerine doğrudan
  //alert dialogun bir copysini yaratmış oluyorum
  // bu daha performanslı bir kullanım avantajı sağlar.
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      true); //update basınca true değerini döndürebiliriz.
                },
                child: Text("Update")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"))
          ],
        );
}

//ignore: unused_element
class _ImageZoomDialog extends StatelessWidget {
  //image full yapılırsa
  const _ImageZoomDialog({
    super.key,
  });
  final String _url =
      "https://media.istockphoto.com/id/1023364994/tr/foto%C4%9Fraf/uv-portre-kadar-kapat%C4%B1n.webp?s=612x612&w=is&k=20&c=503ijRsIGh1uTwKqrqQ97wU58YaBUePSuuOUsFfHNMw=";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      //buna biraz renk katalım

      insetPadding: EdgeInsets.zero,

      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          //ekrana göre boyutlandıralım
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
