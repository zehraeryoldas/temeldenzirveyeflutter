import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _SecureKeys { token }

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({super.key});

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

class _SharedContextLearnState extends State<SharedContextLearn> {
  final _storage = FlutterSecureStorage();
  String _title = '';
  TextEditingController controller = TextEditingController();
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title =
        await _storage.read(key: _SecureKeys.token.name) ?? ''; //bunu verdik
    //şimdide ekranı güncellemek için setState verelim.

    //eğer adamın token'i varsac
    if (_title.isNotEmpty) {
      print('Bu adam onceden kullanmis appi ve tokeni bu');
      controller.text = "";
    }

    setState(() {}); //burada güncelliyoruz.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: Text("Save"),
      ),
      body: TextField(
        onChanged: saveItems,
        controller: controller,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
