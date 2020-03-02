import 'package:flutter/material.dart';

class PokedexHeader extends StatefulWidget {
  @override
  _PokedexHeaderState createState() => _PokedexHeaderState();
}

class _PokedexHeaderState extends State<PokedexHeader> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    // double heightSize = MediaQuery.of(context).size.height;
    return Container(
      // color: Colors.red[],
      child: Stack(
        children: <Widget>[
          Container(
            width: widthSize,
            height: 165,
            decoration: BoxDecoration(
              color: Color(0xffE51D20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipHeaderShadow(),
            child: Container(
              width: widthSize,
              height: 165,
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipHeader(),
            child: Container(
              width: widthSize,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 120,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 150,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 180,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 25,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue[800],
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(1.0, 3.0),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 18.0, top: 15),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue[200],
                  ),
                ),
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
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width * 0.7, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width, 0.0);
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
    path.lineTo(size.width * 0.53, size.height);
    path.lineTo(size.width * 0.73, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, 0.0);
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
