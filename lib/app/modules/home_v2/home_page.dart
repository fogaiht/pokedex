import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'pages/left_page.dart';
import 'pages/right_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return PageView(
        controller: controller.pageController,
        physics: controller.store.selectedPokemon == null ? NeverScrollableScrollPhysics() : null,
        children: <Widget>[
          LeftPage(homeController: controller),
          RightPage(homeController: controller),
        ],
      );
    });
  }
}
