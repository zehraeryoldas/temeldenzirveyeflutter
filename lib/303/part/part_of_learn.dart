import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//part ana class //bu sayede importlar buraya gelir. ana classdan gelirler.
part 'part_appbar.dart';

class partOfLearn extends StatefulWidget {
  const partOfLearn({super.key});

  @override
  State<partOfLearn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<partOfLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _partOfAppBar(),
    );
  }
}

//appbar hata verdiği için prefferredsizeden partofappbarı türetmem gerekiyor
//daha sonra kendi appbarımı oluşturmaya başlayacağım

//ama diyelim bu yapıdan birsürü oluştu o zaman bunu private yapalım
// class _partOfAppBar extends StatelessWidget with PreferredSizeWidget {
//   const _partOfAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text("a"),
//       actions: [IconButton(onPressed: () {}, icon: Icon(Icons.abc_rounded))],
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
