import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigateHomeDetail extends StatefulWidget {
  const NavigateHomeDetail({super.key, this.id});
  //home bir yerden gelecek o zaman String Id ile gelsin bana
  final String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ekran drawi bittikten sonra call ediyoruz
    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments;
      //bunları kapatalım
      //print(_modelId);
      //_id = widget.id ?? " ";
      setState(() {
        _id = _modelId is String ? _modelId : widget.id;
      });
    });

    //final _modelId = ModalRoute.of(context)?.settings.arguments;
    // print(_modelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).errorColor,
      appBar: AppBar(
        title: Text(_id ?? ' '),
      ),
    );
  }
}
