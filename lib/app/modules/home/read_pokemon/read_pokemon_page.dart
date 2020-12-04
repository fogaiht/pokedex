import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'read_pokemon_controller.dart';

class ReadPokemonPage extends StatefulWidget {
  final String title;
  const ReadPokemonPage({Key key, this.title = "ReadPokemon"})
      : super(key: key);

  @override
  _ReadPokemonPageState createState() => _ReadPokemonPageState();
}

class _ReadPokemonPageState
    extends ModularState<ReadPokemonPage, ReadPokemonController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
