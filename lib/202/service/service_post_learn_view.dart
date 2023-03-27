import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/202/model/post_model.dart';


class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  // ignore: prefer_final_fields
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  bool _isLoading = false;

  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(postModel model) async {
    _changeLoading();
    final response = await _dio.post(
        "posts" //posta istek atıyorum burada bir farkla datamız da var
        ,
        data: model);
    if (response.statusCode == HttpStatus.created) {
      name = "Succesfully!";
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("postman"),
        actions: [
          _isLoading
              ? CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "title"),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyController,
            decoration: InputDecoration(labelText: "body"),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: "userId"),
          ),
          ElevatedButton(
              onPressed:
                  _isLoading //benim servisim isloading sırasında ise o zaman null değilse null dan sonraki işlemler yapılır.
                      ? null
                      : () {
                          if (_titleController.text.isNotEmpty &&
                              _bodyController.text.isNotEmpty &&
                              _userIdController.text.isNotEmpty) ;

                          final model = postModel(
                              //burayı servise yollayalım
                              title: _titleController.text,
                              body: _bodyController.text,
                              userId: int.tryParse(_userIdController.text));
                          _addItemToService(model);
                        },
              child: Text("send")),
        ],
      ),
    );
  }
}

// class _PostCard extends StatelessWidget {
//   const _PostCard({
//     super.key,
//     required postModel? model,
//   }) : _model = model;

//   final postModel? _model;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 10),
//       child: ListTile(
//         title: Text(_model?.title ?? ''),
//         subtitle: Text(_model?.body ?? ''),
//       ),
//     );
//   }
// }
