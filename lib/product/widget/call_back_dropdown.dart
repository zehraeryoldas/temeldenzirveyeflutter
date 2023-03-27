import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({super.key, required this.onUserSelected});

  //bu sayede ana ekrana bildiriyioruz.
  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _users;

// callbackten ana ekranın haberi olsun diye bu metodu yazdık yukarıda callback mettoları ile destekledik
  void _updateUser(CallBackUser? item) {
    setState(() {
      _users = item;
    });

    if (_users != null) {
      //bu şekilde kullanarak datamızı yolladık.
      widget.onUserSelected.call(_users!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _users,
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            child: Text(
              e.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            value: e,
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
