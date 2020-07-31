import 'package:flutter/material.dart';

import '../../../../../shared/models/pokemon_model.dart';
import 'pokedex_pokeinfo.dart';

class PokedexScreenRight extends StatefulWidget {
  final PokemonModel selectedPokemon;

  const PokedexScreenRight({Key key, this.selectedPokemon}) : super(key: key);


  @override
  _PokedexScreenRightState createState() => _PokedexScreenRightState();
}

class _PokedexScreenRightState extends State<PokedexScreenRight> {
  bool title = true;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;

    print(widget.selectedPokemon.name);
    return ClipPath(
      clipper: ClipScreenShadow(),
      child: Container(
        width: widthSize,
        height: heightSize,
        decoration:
            BoxDecoration(color: Colors.red[900], borderRadius: BorderRadius.all(Radius.circular(heightSize * 0.035))),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: ClipScreenShadow(),
              child: Container(
                width: widthSize,
                height: heightSize,
                decoration: BoxDecoration(
                    color: Colors.red[900], borderRadius: BorderRadius.all(Radius.circular(heightSize * 0.035))),
              ),
            ),
            Positioned(
                top: heightSize * 0.03,
                bottom: heightSize * 0.03,
                right: heightSize * 0.03,
                left: heightSize * 0.03,
                child: PokeInfo(selectedPokemon: widget.selectedPokemon)),
          ],
        ),
      ),
    );
    // color: Colors.red[],
  }
}

class ClipScreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, 0.0);
    path.lineTo(size.width * 0.1, size.height * 0.95);
    path.lineTo(size.width * 0.95, size.height * 0.95);
    path.lineTo(size.width * 0.95, size.height * 0.185);
    path.lineTo(size.width * 0.67, size.height * 0.185);
    path.lineTo(size.width * 0.48, size.height * 0.04);
    path.lineTo(size.width * 0.1, size.height * 0.04);
    path.lineTo(size.width * 0.1, size.height * 0.95);
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class ClipScreenShadow extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.1);
    path.lineTo(size.width * 0.62, size.height * 0.1);
    path.lineTo(size.width * 0.46, 0.0);
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
