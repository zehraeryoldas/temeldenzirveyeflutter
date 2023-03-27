

import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paraf = "/";
  final items = {
    paraf: (context) => const LottieLearn(),
    //"/feed": (context) => const FeedView(),
    NavigateRoutes.home.withParaf: (context) => const navigatorHomeView(),
    //"/NavigateHomeDetail": (context) => const NavigateHomeDetail()
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigateRoutes { init, home, detail }
//navigateroutes' ı eğer kullanmak istiyorsak buna extension kazandırmamız gerekiyor.

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
