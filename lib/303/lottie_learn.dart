import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../product/consustant/duration_items.dart';
import '../product/consustant/lottie_items.dart';


class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  bool _isLight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    // navigateToHome();
  }

  // Future<void> navigateToHome() async {
  //   //bu bir saniye beklesin yan, işlem gözüksün ardından direkt açsın. Bu işlem olduktan sonr ayan sayfaya gitsin
  //   await Future.delayed(const Duration(seconds: 1));

  //   // Navigator.of(context).pushNamed(NavigateRoutes.home.withParaf);
  //   //eğer yeni gelen sayfada bir önceki sayfaya dönüş butonunun olmamasını istiyorsak eğer push replacement named'i kullanmamız gererkiyor
  //   //deneyelim.
  //   //bu çok önemli bir kullanım. Dikkat etmemiz gerekiyor.
  //   Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                await animationController.animateTo(_isLight ? 0.5 : 1);
                //setstate gerek yok controller işlemi hallediyor
                _isLight = !_isLight;
                //bittikten sonra tetiklenmesini istiyorsak bunu yazabiliriz.
                //burası hata verdi (vB lottie videosu)
                // Future.microtask(() {
                //   context.read<ThemeNotifer>().changeTheme();
                // });
              },
              child: Lottie.asset(
                LottieItems.themeChange.LottiePath,
                repeat: false,
                controller: animationController,
              ))
        ],
      ),
      body: LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
  final _loadingLottie =
      "https://assets6.lottiefiles.com/packages/lf20_pvjwvcvn.json";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottie),
    );
  }
}
