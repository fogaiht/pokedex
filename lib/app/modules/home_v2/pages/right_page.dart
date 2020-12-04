import 'package:flutter/material.dart';

import '../components/pokedex/pokedex_right/poke_join_right.dart';
import '../components/pokedex/pokedex_right/pokedex_screen_right.dart';
import '../home_controller.dart';

class RightPage extends StatelessWidget {
  final HomeController homeController;

  const RightPage({Key key, this.homeController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: widthSize * 0.315,
              bottom: widthSize * 0.0518,
              child: PokedexScreenRight(selectedPokemon: homeController.store.selectedPokemon,),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  PokejoinRight(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
