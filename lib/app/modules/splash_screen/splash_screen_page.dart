import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key key, this.title = "SplashScreen"}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> opacityAnimation;

  @override
  void didChangeDependencies() {
    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animController, curve: Interval(0, 1, curve: Curves.easeInQuad)));

    super.didChangeDependencies();
  }

  @override
  void initState() {
    animController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    animController.forward();
    Timer(Duration(milliseconds: 3500), () {
      Modular.to.pushReplacementNamed("/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    // double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Container(
                  width: widthSize * 0.9,
                  child: AnimatedBuilder(
                    animation: animController,
                    builder: (context, snapshot) {
                      // print(opacityAnimation.value);
                      return Opacity(
                        opacity: opacityAnimation.value,
                        child: opacityAnimation.value < 0.5
                            ? Container(
                                height: widthSize * 0.5,
                                width: widthSize * 0.5,
                                child: Image.asset(
                                  "assets/notCapturedPokemonStar2.png",
                                ),
                              )
                            : Container(
                                height: widthSize * 0.5,
                                width: widthSize * 0.5,
                                child: Image.asset(
                                  "assets/capturedPokemonStar2.png",
                                ),
                              ),
                      );
                    },
                  ),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: widthSize * 0.2,
                      child: Image.asset('assets/FogaihtDev.png'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
