import 'package:flutter/material.dart';

import '../components/pokedex/pokedex_left/poke_join_left.dart';
import '../components/pokedex/pokedex_left/pokedex_bottom.dart';
import '../components/pokedex/pokedex_left/pokedex_header.dart';
import '../components/pokedex/pokedex_left/pokedex_screen.dart';
import '../home_controller.dart';

class LeftPage extends StatelessWidget {
  final HomeController homeController;

  const LeftPage({Key key, this.homeController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Spacer(),
                PokedexHeader(),
                Center(
                  child: PokedexScreen(
                    homeController: homeController,
                  ),
                ),
                PokedexBottom(homeController: homeController),
                Spacer(),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  PokejoinLeft(),
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
