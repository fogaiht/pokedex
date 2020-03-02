import 'package:flutter/material.dart';

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffE51D20),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            right: 35,
            child: Container(
              width: 350,
              height: 300,
              child: ClipPath(
                clipper: ClipScreen(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 165,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          Positioned(
            top: 75,
            right: 165,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 75,
            child: Container(
              width: 260,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color(0xff222222),
                
              ),
              child: Center(
                child: Text(
                  "95\nPokemons",
                  style: TextStyle(
                    color: Color(0xff00ff00),
                    fontSize: 35,
                    fontFamily: 'SevenSegment',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 175,
            left: 80,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          Positioned(
            bottom: 145,
            right: 80,
            child: Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipScreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.8);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
