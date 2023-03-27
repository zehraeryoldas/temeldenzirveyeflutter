import 'package:flutter_test/flutter_test.dart';

import 'generic_learn.dart';

void main() {
  setUp(() {});
  test('User Calculate', () {
    final users = [
      genericUser("Vb", "10", 15),
      genericUser("Vb", "10", 16),
      genericUser("Vb", "10", 20),
    ];
    // final result = UserManagement().calculateMoney(users);

    //şu an buraya sadece admin erişiyor.
    final result =
        UserManagement(AdminUser("vadmin", "1", 15, 1)).calculateMoney(users);

    UserManagement(AdminUser("vadmin", "1", 15, 1)).showNames(users);
    expect(result, 55);
  });
}
