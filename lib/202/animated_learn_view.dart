import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;
  double KZero = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _durationItems.durationLow);
  }

  late AnimationController controller;

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      // Text(
      //   "data",
      //   style: context.textTheme().headline1,
      // ),
      appBar: AppBar(title: _placeHolderWidget()),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0); //iconu oynatacağız
      }),
      //body: _isVisible ? Placeholder() : null,
      //body: _placeHolderWidget(),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              opacity: _isOpacity ? 1 : 0,
              duration: _durationItems.durationLow,
              child: Text("data"),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeOpacity();
              },
              icon: Icon(Icons.precision_manufacturing_rounded),
            ),
          ),
          AnimatedDefaultTextStyle(
              child: Text("hello"),
              style: (_isVisible
                      ? context.textTheme().headlineLarge //3 boyutlu efekt
                      : context.textTheme().bodySmall) ??
                  TextStyle(), //eğer önceki işlemlerde bir sorun çıkarsa default olarak textstyle almasını sağlayacağız
              duration: _durationItems.durationLow),
          AnimatedIcon(icon: AnimatedIcons.home_menu, progress: controller),
          AnimatedContainer(
            duration: _durationItems.durationLow,
            height:
                _isVisible ? KZero : MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.pink,
            margin: EdgeInsets.all(20),
          ),
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                child: Text("Data"),
                duration: _durationItems.durationLow,
                top: 30,
                curve: Curves.elasticOut,
              )
            ],
          )),
          Expanded(
            //expanded vermemizin sebebi listenin ne kadar olacağını bilmediğimiz için vermemiz gerekiyor. Eğer expanded verilmezse uygulama hata verir.
            child: AnimatedList(itemBuilder: ((context, index, animation) {
              return Text("severus");
            })),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: Placeholder(),
        secondChild: SizedBox.shrink(),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _durationItems
            .durationLow); //en azından projede duration propertisini bu şekilde kullanmak büyük bir avantaj sağlar bize
    //hepsini nereden elde ettiğimizi bulabilirz bu sayede
  }
}

extension BuildContextExtension on BuildContext {
  //bunu yaparak contextdeki her şeye erişebilirsin.
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

//durationlar için bir class oluşturalım

class _durationItems {
  static const durationLow = Duration(seconds: 2);
}
