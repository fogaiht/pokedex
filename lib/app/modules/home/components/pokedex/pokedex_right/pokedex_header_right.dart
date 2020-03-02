import 'package:flutter/material.dart';

class PokedexHeaderRight extends StatefulWidget {
  @override
  _PokedexHeaderRightState createState() => _PokedexHeaderRightState();
}

class _PokedexHeaderRightState extends State<PokedexHeaderRight> {
  bool title = true;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      // color: Colors.red[],
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClipHeaderShadow(),
            child: Container(
              width: widthSize,
              height: heightSize,
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
            ),
          ),
          ClipPath(
            clipper: ClipHeader(),
            child: Container(
              width: widthSize,
              height: heightSize,
              decoration: BoxDecoration(
                color: Color(0xffE51D20),
              ),
            ),
          ),
          Positioned(
            // left: 45,
            // top: heightSize * 0.035,
            
            left: widthSize * 0.11,
            top: heightSize * 0.035,
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset("assets/pokeball.png"),
              ),
            ),
          ),
          Positioned(
            // left: 60,
            left: widthSize * 0.15,
            // top: 15,
            top: heightSize * 0.02,
            child: Text(
              title ? "\nLista\n\b\b\b\b\b\bPokémon" : "\nQuem é\n\b\besse Pokémon?",
              style: TextStyle(
                  fontSize: 40, fontFamily: "Pokemon", color: Colors.yellow),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  title = !title;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipHeader extends CustomClipper<Path> {
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

class ClipHeaderShadow extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(size.width * 0.7, size.height * 0.15);
    path.lineTo(size.width * 0.5, 0.0);
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
