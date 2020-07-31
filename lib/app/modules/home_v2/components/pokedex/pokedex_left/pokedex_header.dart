import 'package:flutter/material.dart';

class PokedexHeader extends StatefulWidget {
  @override
  _PokedexHeaderState createState() => _PokedexHeaderState();
}

class _PokedexHeaderState extends State<PokedexHeader> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height * 0.95;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: widthSize,
            height: heightSize * 0.22,
            decoration: BoxDecoration(
              color: Color(0xffE51D20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(heightSize * 0.035),
                topRight: Radius.circular(heightSize * 0.035),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipHeaderShadow(),
            child: Container(
              width: widthSize,
              height: heightSize * 0.22,
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(heightSize * 0.035),
                  topRight: Radius.circular(heightSize * 0.035),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipHeader(),
            child: Container(
              width: widthSize,
              height: heightSize * 0.22,
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(heightSize * 0.035),
                  topRight: Radius.circular(heightSize * 0.035),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.166,
            left: widthSize * 0.36,
            child: Container(
              height: widthSize * 0.04,
              width: widthSize * 0.04,
              decoration: BoxDecoration(
                color: Color(0xffff0000),
                borderRadius: BorderRadius.circular(heightSize),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.166,
            left: widthSize * 0.423,
            child: Container(
              height: widthSize * 0.04,
              width: widthSize * 0.04,
              decoration: BoxDecoration(
                color: Color(0xffffff00),
                borderRadius: BorderRadius.circular(heightSize),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.166,
            left: widthSize * 0.486,
            child: Container(
              height: widthSize * 0.04,
              width: widthSize * 0.04,
              decoration: BoxDecoration(
                color: Color(0xff00ff00),
                borderRadius: BorderRadius.circular(heightSize * 0.06),
              ),
            ),
          ),
          Positioned(
            top: heightSize * 0.166 * 0.26,
            left: widthSize * 0.11,
            child: Container(
              height: widthSize * 0.185,
              width: widthSize * 0.185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(heightSize),
                color: Colors.blue[800],
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(1.0, 3.0),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  // width: 5,
                  width: widthSize * 0.012,
                ),
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: widthSize * 0.0432, top: widthSize * 0.036),
                child: Container(
                  width: widthSize * 0.036,
                  height: widthSize * 0.036,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(heightSize * 0.06),
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
  // height: heightSize * 0.22, => 4,28cm
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.85);
    path.lineTo(size.width * 0.45, size.height * 0.85);
    path.lineTo(size.width * 0.6, size.height * 0.544);
    path.lineTo(size.width, size.height * 0.544);
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
    path.lineTo(size.width * 0.45, size.height);
    path.lineTo(size.width * 0.6, size.height * 0.696);
    path.lineTo(size.width, size.height * 0.696);
    path.lineTo(size.width, 0.0);
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
