import 'package:flutter/material.dart';

class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    double width1Size = widthSize * 0.00243;
    double height1Size = heightSize * 0.00117;
    return Container(
      // height: 500,
      height: heightSize * 0.585,
      width: widthSize,
      color: Color(0xffE51D20),
      child: Stack(
        children: <Widget>[
          Positioned(
            // top: 60,
            // right: 35,
            top: heightSize * 0.065,
            right: widthSize * 0.085,
            child: Container(
              // width: 350,
              width: widthSize * 0.85,
              // height: 300,
              height: heightSize * 0.354,
              child: ClipPath(
                clipper: ClipScreen(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(heightSize * 0.025),
                    ),
                    color: Color(0xffaaaaaa),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // top: 75,
            top: heightSize * 0.088,
            // left: 165,
            left: widthSize * 0.412,
            child: Container(
              // width: 10,
              // height: 10,
              width: heightSize * 0.0117,
              height: heightSize * 0.0117,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(heightSize * 0.1)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          Positioned(
            top: heightSize * 0.088,
            right: widthSize * 0.412,
            child: Container(
              width: heightSize * 0.0117,
              height: heightSize * 0.0117,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(heightSize * 0.1)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          
          Positioned(
            //  top: 100,
            // left: 75,
            top: heightSize * 0.117,
            left: widthSize * 0.182,
            child: Container(
              width: widthSize * 0.632,
              height: heightSize * 0.234,
              // width: 260,
              // height: 200,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(heightSize * 0.0175)),
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
            // bottom: 175,
            // left: 80,
            bottom: height1Size * 175,
            left: width1Size * 80,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(heightSize * 0.1)),
                color: Color(0xffff0000),
              ),
            ),
          ),
          Positioned(
            // bottom: 145,
            // right: 80,
            bottom: height1Size * 145,
            right: width1Size * 80,
            child: Container(
              height: height1Size * 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: width1Size * 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: width1Size * 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: width1Size * 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: width1Size * 40,
                    height: 1,
                    color: Color(0xff000000),
                  ),
                  Container(
                    width: width1Size * 40,
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
