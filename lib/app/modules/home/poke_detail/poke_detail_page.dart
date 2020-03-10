import 'package:flutter/material.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/poke_join_right.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/pokedex_base_stats.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/pokedex_screen_right.dart';
import 'package:poke_api/app/shared/models/pokemon_model.dart';

class PokeDetailPage extends StatefulWidget {
  final String title;
  final PokeModel pokeModel;
  const PokeDetailPage({Key key, this.title = "PokeDetail", this.pokeModel})
      : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  bool baseStats = true;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: heightSize * 0.152,
            bottom: heightSize * 0.025,
            child: PokedexScreenRight(),
          ),
          Positioned(
              bottom: heightSize * 0.025, left: 0, child: PokejoinRight()),
        ],
      ),
    );
  }
}
