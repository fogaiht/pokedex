import 'package:flutter/material.dart';

import 'poke_join_right.dart';
import 'pokedex_screen_right.dart';

class PokedexRight extends StatefulWidget {
  @override
  _PokedexRightState createState() => _PokedexRightState();
}

class _PokedexRightState extends State<PokedexRight> {
  @override
  Widget build(BuildContext context) {
    // double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              top: heightSize * 0.152,
              bottom: heightSize * 0.025,
              child: PokedexScreenRight()),
          Positioned(
              bottom: heightSize * 0.025, left: 0, child: PokejoinRight()),
        ],
      ),
    );
  }
}
