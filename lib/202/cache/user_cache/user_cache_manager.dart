import 'dart:convert';



import '../shared_manager.dart';
import '../user_model.dart';

class UserCacheManager {
  final SharedManager manager;

  UserCacheManager(this.manager);

  Future<void> saveItems(List<User> items) async {
    final _items = items
        .map((element) => jsonEncode(element.toJson()))
        .toList(); //e: items içerisindeki bütün userları döndürüyor.
    await manager.saveStringItems(SharedKeys.users, _items);
  }

  // void getItems() {
  List<User>? getItems() {
    //ben adama list<user> döndürücem.
    final itemString = manager.getStringItems(SharedKeys.users);
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        //return User("name", "description", "url");
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
