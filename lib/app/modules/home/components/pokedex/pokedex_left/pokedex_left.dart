import 'package:flutter/material.dart';
import 'poke_join_left.dart';
import 'pokedex_bottom.dart';
import 'pokedex_header.dart';
import 'pokedex_screen.dart';

class PokedexLeft extends StatefulWidget {
  @override
  _PokedexLeftState createState() => _PokedexLeftState();
}

class _PokedexLeftState extends State<PokedexLeft> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(top: heightSize * 0.025, child: PokedexHeader()),
          Positioned(top: heightSize * 0.233, child: PokedexScreen()),
          Positioned(bottom: heightSize * 0.025, child: PokedexBottom()),
          Positioned(
              bottom: heightSize * 0.025, right: 0, child: PokejoinLeft()),
        ],
      ),
    );
  }
}
