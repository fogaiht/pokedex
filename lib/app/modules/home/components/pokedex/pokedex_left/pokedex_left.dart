import 'package:flutter/material.dart';
import 'poke_join_left.dart';
import 'pokedex_btn_search.dart';
import 'pokedex_header.dart';
import 'pokedex_screen.dart';

class PokedexLeft extends StatefulWidget {
  @override
  
  
  _PokedexLeftState createState() => _PokedexLeftState();
}



class _PokedexLeftState extends State<PokedexLeft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
            children: <Widget>[
              Positioned(
                top: 15,
                child: PokedexHeader(),
              ),
              Positioned(
                top: 180,
                child: PokedexScreen(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: PokedexButtonSearch(),
              ),
              Positioned(
                top: 105,
                bottom: 15,
                right: 0,
                child: PokejoinLeft(),
                
              ),
            ],
          ),
    );
  }
}