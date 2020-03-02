import 'package:flutter/material.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/poke_join_right.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/pokedex_header_right.dart';

class PokedexRight extends StatefulWidget {
  @override
  _PokedexRightState createState() => _PokedexRightState();
}

class _PokedexRightState extends State<PokedexRight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 120,
            bottom: 15,
            child: PokedexHeaderRight(),
          ),
          Positioned(
            top: 105,
            bottom: 15,
            left: 0,
            child: PokejoinRight(),
          ),
        ],
      ),
    );
  }
}
