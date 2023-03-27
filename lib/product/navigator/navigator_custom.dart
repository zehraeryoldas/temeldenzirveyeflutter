// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/303/lottie_learn.dart';

import '../../303/mobx_imagepicker/view/mobx_image_upload_view.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';
import 'navigator_routes.dart';

class NavigatorCustom {
  Route<dynamic>? OnGenerateRoutes(RouteSettings settings) {
    //eğer name boş gelmişse değilse true
    if (settings.name?.isEmpty ?? true) {
      //önceden bu vardı
      _navigateToNormal(MobxImageUpload());
      //şimdi de bunu yaptık
      //_navigateToNormal(MobxImageUpload());
    }

    //bu işlemi böyle yazınca aşğaıda bütün senaryoları handle edebilirm
    //eğer navigator.paraf eşitse setting.name'e NavigateRoutes'in init sayfasını çalıştır. Değilse diğerini
    final _routes = settings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(settings.name!.substring(1));

    //senaryolar
    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(LottieLearn());

      case NavigateRoutes.home:
        return _navigateToNormal(navigatorHomeView());
      case NavigateRoutes.detail:
        final _id = settings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(
              id: _id is String ? _id : null,
            ),
            isFullScreenDialog: true);
    }

//bu kullanım da olabilir ama switch case ile yazmak daha güzel(temelden zirveye 17.video 48. dk)
    // if (settings.name == "/") {
    //   return _navigateToNormal(LottieLearn());
    // } else if (settings.name == "/homeDetail") {
    //   final _id = settings.arguments;
    //   return _navigateToNormal(NavigateHomeDetail(
    //     id: _id is String ? _id : null,
    //   ));
    // }
    // return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog})
  // {bool? isFullScreenDialog} bunu sonradan ekledik.
  {
    //bu işlemleri her yere yazmamak için bu metodu yazdık. private yazdık ki başkası görmesin
    //gayet temiz bir kullanım
    return MaterialPageRoute(
        //eğer bir ekranın popup şeklinde gelmesini istiyorsak eğer fullscreen parametresini aktifleştirmemiz gerekiyor.
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (BuildContext context) {
          return child;
        });
  }
}
