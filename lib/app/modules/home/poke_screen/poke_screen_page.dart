import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/pokedex/pokedex_left/poke_join_left.dart';
import '../components/pokedex/pokedex_left/pokedex_bottom.dart';
import '../components/pokedex/pokedex_left/pokedex_header.dart';
import '../components/pokedex/pokedex_left/pokedex_screen.dart';
import '../home_controller.dart';
import 'poke_screen_controller.dart';

class PokeScreenPage extends StatefulWidget {
  final String title;
  const PokeScreenPage({Key key, this.title = "PokeScreen"}) : super(key: key);

  @override
  _PokeScreenPageState createState() => _PokeScreenPageState();
}

class _PokeScreenPageState
    extends ModularState<PokeScreenPage, PokeScreenController> {
  //use 'controller' variable to access controller


  HomeController homeController = Modular.get();
  @override
  Widget build(BuildContext context) {
    
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      width: widthSize,
      height: heightSize,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: heightSize * 0.025,
            child: PokedexHeader(),
          ),
          Positioned(
            top: heightSize * 0.233,
            child: PokedexScreen(),
            // child: Container(),
          ),
          Positioned(
            bottom: heightSize * 0.025,
            child: PokedexBottom(
              onLeftTap: () {
                print("Left Tap");
              },
              onRightTap: () {
                // onRightClick();
                print("Right Tap");
              },
            ),
          ),
          Positioned(
            bottom: heightSize * 0.025,
            right: 0,
            child: PokejoinLeft(),
          ),
        ],
      ),
    );
  }
}

class ClipScreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.837);
    path.lineTo(size.width * 0.137, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
