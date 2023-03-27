import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temeldenzirveyeflutter/202/cache/shared_manager.dart';
import 'package:temeldenzirveyeflutter/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  var _currentValue = 0;
  late final SharedManager
      _manager; //İNİTSTATE EŞİTLENİP VE BİR DAHA DEĞER ALMAYACAKTIR.

  late final List<User> userItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _manager = SharedManager();
    userItems = UserItems()
        .users; //dataları görebilmem için damileri böyle yapmamız gerekiyor.
    //tekrar çalıştırdığımda initState de gelmesi için damileri yazdık.
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? _counter = prefs.getInt('counter');
    //_onChangedValue(_counter.toString());
    _onChangedValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangedValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, //sadece kapladığı alan kadar alacak.
        children: [_saveValueButton(), _removeValueButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangedValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter',
        //     _currentValue); //setInt diyince datayı key de saklıyor data: _currentValue, key: counter
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: Icon(Icons.remove),
    );
  }
}

// class User {
//   final String name;
//   final String description;
//   final String url;

//   User(this.name, this.description, this.url);
// }

//damileme
class UserItems {
  late final List<User> users;
  UserItems() {
    //datalarımızı cachelememiz gerekiyor.
    users = [
      User("ze", "pc.müh.", "gmail.com"),
      User("fy", "pc.müh.", "gmail.com"),
      User("gç", "pc.müh.", "gmail.com"),
    ];
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
