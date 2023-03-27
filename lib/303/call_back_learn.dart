import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../product/widget/button/answer_button.dart';
import '../product/widget/button/loading_button.dart';
import '../product/widget/call_back_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  // CallBackUser? _users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(onUserSelected: (CallBackUser user) {
            print(user);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: "save",
              onpressed: () async {
                await Future.delayed(Duration(seconds: 1));
              })
          //böyle kompleks bir olayı burada yazmak yerine ayrı bir dosya açıp oradan çağıralım
          // DropdownButton<CallBackUser>(
          //     value: _users,
          //     items: CallBackUser.dummyUsers().map((e) {
          //       return DropdownMenuItem(
          //         child: Text(
          //           e.name,
          //           style: Theme.of(context).textTheme.headlineLarge,
          //         ),
          //         value: e,
          //       );
          //     }).toList(),
          //     onChanged: (CallBackUser? callbackuser) {
          //       setState(() {
          //         _users = callbackuser;
          //       });
          //     })
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;
  CallBackUser(this.name, this.id);

// ignore: todo
// TODO: Dummy remove it
  static List<CallBackUser> dummyUsers() {
    return [CallBackUser("vb", 123), CallBackUser("vb2", 1234)];
  }

  //bunun override edilmesinin sebebi item value den listede sadece bir tane olması
  //gerekiyor. o yüzden bunu yazdık. (veli bacık: part of videosu dk:20:00)
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
