import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        onChanged: () => print("a"), //yapılan her değişiklik buraya giriyor.
        autovalidateMode: AutovalidateMode
            .always, //zorunlu bildiriminin her zaman çalışmasını istiyorsak eğer bunu entegre etmeliyiz
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: [
                  DropdownMenuItem(
                    child: Text("a"),
                    value: 'b',
                  ),
                  DropdownMenuItem(
                    child: Text("a"),
                    value: 'c',
                  ),
                  DropdownMenuItem(
                    child: Text("a"),
                    value: 'd',
                  )
                ],
                onChanged: (value) {}),
            CheckboxListTile(value: true, onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("okey");
                  }
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._isnotEmpty;
  }
}

class ValidatorMessage {
  static String _isnotEmpty = 'Boş geçilemez';
}
