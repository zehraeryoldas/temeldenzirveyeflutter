import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/202/cache/shared_manager.dart';

import 'shared_learn_cache.dart';
import 'user_cache/user_cache_manager.dart';
import 'user_model.dart';


class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  //List<User> _users = UserItems().users;
  List<User> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAndSave();
  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init;
    userCacheManager = UserCacheManager(manager);
    //bunu sonradan ekledim
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                    onPressed: () async {
                      changeLoading();
                      await userCacheManager.saveItems(_users);
                      changeLoading();
                    },
                    icon: Icon(Icons.download_for_offline)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove_circle_outline_outlined))
              ],
      ),
      body: _userListView(
        users: _users,
      ),
    );
  }
}

class _userListView extends StatelessWidget {
  _userListView({
    super.key,
    required this.users,
  });
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            //ben bu dataları saklayıp işlem yapmak istiyorum.
            child: ListTile(
              title: Text(users[index].name ?? ''), //burada null gelebilir diye
              subtitle: Text(
                users[index].description ?? '',
              ),
              trailing: Text(
                users[index].url ?? '',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    decoration: TextDecoration.underline, color: Colors.blue),
              ),
            ),
          );
        });
  }
}
