import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'poke_detail/poke_detail_module.dart';
import 'poke_screen/poke_screen_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  PageController pageViewController = PageController();

  @override
  void initState() {
    controller.getUser();

    if (controller.screenPage) {
      pageViewController = PageController(initialPage: 0);
    } else {
      pageViewController = PageController(initialPage: 1);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: pageViewController,
            scrollDirection: Axis.horizontal,
            reverse: false,
            children: <Widget>[
              PokeScreenModule(),
              PokeDetailModule(),
            ],
          ),
        ),
      ),
    );
  }
}
