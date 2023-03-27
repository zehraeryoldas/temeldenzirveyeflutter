import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:temeldenzirveyeflutter/202/model/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  //final user9 = Model8();
  var user9 = Model8();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user1 = Model()
      ..userId = 1
      ..body = "assdd";
    user1.body = "hello";

    final user2 = Model2(1, 2, '', 'body');
    user2.body = "werwe";

    final user3 = Model3(1, 1, 'title', 'body');

    //Local işlemleri için
    final user4 = Model4(userId: 1, id: 2, title: 'title', body: 'body');
    final user5 = Model5(userId: 1, id: 2, title: 'title', body: 'body');
    //user5.userId;

    final user6 = Model6(userId: 1, id: 2, title: 'title', body: 'body');

    final user7 = Model7();

    //service işlemleri
    final user8 = Model8(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          //user9 = Model8(body: 'on pressed');
          user9 = user9.copyWith(title: 'vb');
        });
      }),
      appBar: AppBar(
        title: Text(user9.title ?? 'not has any data'),
      ),
    );
  }
}
