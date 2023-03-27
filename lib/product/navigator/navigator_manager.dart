//bir sayfadan bir sayfaya giderken genelde kullanmak istediğim lojiikleri ben burada kullanıyorum.
//yani aslında context kullanmadan yapmayı öğreniyorum

import 'package:flutter/material.dart';

import 'navigator_routes.dart';

//best practise
class NavigatorManager {
  //  GlobalKey<NavigatorState> :Bu biizm navigationlarımızı yönetmemeizi sağlıyor.

  //bunu her defasında kullanmasınlar bunu kapatıp bir singelton yapalım.
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  //ben bütün navigationlaırmı burada yapacam

  Future<void> pushToPage(NavigateRoutes routes, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState
        ?.pushNamed(routes.withParaf, arguments: arguments);
  }
}
