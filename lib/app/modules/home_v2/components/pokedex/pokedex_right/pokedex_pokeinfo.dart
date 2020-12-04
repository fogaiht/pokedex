import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../shared/models/pokemon_model.dart';
import 'pokedex_base_stats.dart';

class PokeInfo extends StatefulWidget {
  final PokemonModel selectedPokemon;

  final Color pokeColor;
  final int pokeNumber;

  const PokeInfo({Key key, this.pokeColor, this.pokeNumber, this.selectedPokemon}) : super(key: key);
  @override
  _PokeInfoState createState() => _PokeInfoState();
}

class _PokeInfoState extends State<PokeInfo> {
  bool baseStats = true;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.91;
    double heightSize = MediaQuery.of(context).size.height * 0.848;

    var pokemon =  widget.selectedPokemon;
    return ClipPath(
      clipper: ClipScreen(),
      child: Container(
        width: widthSize,
        height: heightSize,
        decoration: BoxDecoration(
          // color: Color(0xffE51D20),
          color: Colors.green,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: widthSize * 0.015,
              top: heightSize * 0.015,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: heightSize * 0.23,
                  height: heightSize * 0.23,
                  child: Image.asset("assets/pokeball.png"),
                ),
              ),
            ),
            Positioned(
              left: widthSize * 0.11,
              top: heightSize * 0.05,
              child: Text(
                "Quem é",
                style: TextStyle(
                    fontSize: 35, fontFamily: "Pokemon", color: Colors.yellow),
              ),
            ),
            Positioned(
              left: widthSize * 0.2,
              top: heightSize * 0.12,
              child: Text(
                "esse Pokémon?",
                style: TextStyle(
                    fontSize: 35, fontFamily: "Pokemon", color: Colors.yellow),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: heightSize * 0.474,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(heightSize * 0.035),
                    topRight: Radius.circular(heightSize * 0.035),
                  ),
                ),
              ),
            ),
            Positioned(bottom: 0, child: PokedexBaseStats()),
            Positioned(
              top: heightSize * 0.2,
              child: Container(
                width: widthSize,
                height: heightSize,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Positioned(
                      bottom: heightSize * 0.72,
                      left: widthSize * 0.1,
                      right: widthSize * 0.1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: heightSize * 0.245,
                            height: heightSize * 0.245,
                            decoration: BoxDecoration(
                                // color: Colors.green[800],
                                // border: Border.all(width: 1, color: Colors.black),
                                ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  baseStats = !baseStats;
                                });
                              },
                              child: Opacity(
                                opacity: 1,
                                child: Transform.scale(scale: 2.2,child: Image.network(widget.selectedPokemon.sprites.frontDefault)),
                              ),
                            ),
                          ),
                          Container(
                            width: heightSize * 0.245,
                            child: Text(
                              "— ${pokemon.name} —",
                              style: TextStyle(
                                fontSize: heightSize * 0.03,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: heightSize * 0.05,
                      right: 0,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.1,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "#${pokemon.id}",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Pokemon",
                                  color: Colors.yellow),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: heightSize * 0.185,
                      right: widthSize * 0.05,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.125,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey,
                              // border:
                              //     Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: baseStats
                                ? Transform.scale(
                                    scale: 1,
                                    child: Image.asset(
                                        'assets/capturedPokemonStar2.png'))
                                : Transform.scale(
                                    scale: 1,
                                    child: Image.asset(
                                        'assets/notCapturedPokemonStar2.png'))
                            // Text(
                            //     "Captured",
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         fontSize: heightSize * 0.03,
                            //         fontFamily: "Pokemon",
                            //         color: Colors.red),
                            //   ),
                            ),
                      ),
                    ),
                    Positioned(
                      top: heightSize * 0.2,
                      left: 0,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.125,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: widthSize * 0.18,
                              child: Center(
                                child: Text(
                                  "Type",
                                  style: TextStyle(
                                    fontSize: heightSize * 0.025,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: widthSize * 0.18,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "${pokemon.types[0].type.name}",
                                  style: TextStyle(
                                    fontSize: heightSize * 0.02,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            pokemon.types.length > 1 ? Container(
                              width: widthSize * 0.18,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "${pokemon.types[1].type.name}",
                                  style: TextStyle(
                                    fontSize: heightSize * 0.02,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ) : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipScreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, size.height * 0.1);
    // path.lineTo(size.width * 0.62, size.height * 0.1);
    // path.lineTo(size.width * 0.46, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.11);
    path.lineTo(size.width * 0.59, size.height * 0.11);
    path.lineTo(size.width * 0.41, size.height * 0.01);
    path.lineTo(0.0, size.height * 0.01);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
