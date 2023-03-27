// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

class UserManagement<T extends AdminUser> {
  //final AdminUser admin;
  final T
      admin; //sırf engelleyebilelim diye T type verdik. ve erişilmesi için admin user bulundurmak zorunda
  UserManagement(this.admin);
  void sayName(genericUser user) {
    print(user.name);
  }

  //daha sonra adam diyor ki buraya herkesin erişmesini istemiyorum ben admin yapacam diyor
  int calculateMoney(List<genericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    //bu adamın paralarını maplesek sadece paralar dönse bize
    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);

    //for yazmak yerine bunları kullanabiliriz.
    final _money = users.fold<int>(
        0, (previousValue, element) => previousValue + element.money);

    return _money;
  }

  Iterable<T>? showNames(List<genericUser> users) {
    //sonradan eklenenler
    if (T is String) {
      final names = users.map((e) => e.name);
      return names.cast<T>();
    }
    return null;
    //bunu sadece rol 1 olanlar kullansın.
    //final names = users.map((e) => e.name).cast<T>();
    //return names;
  }
}

//sadece liste döndürmek istersem eğer

class genericUser {
  final String name;
  final String id;
  final int money;

  genericUser(this.name, this.id, this.money);
}

class AdminUser extends genericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
