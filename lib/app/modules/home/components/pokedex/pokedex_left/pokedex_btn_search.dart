import 'dart:ui';

import 'package:flutter/material.dart';

class PokedexButtonSearch extends StatefulWidget {
  @override
  _PokedexButtonSearchState createState() => _PokedexButtonSearchState();
}

class _PokedexButtonSearchState extends State<PokedexButtonSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: Color(0xffE51D20),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        // width: MediaQuery.of(context).size.width * 0.85,
        child: Stack(
          children: <Widget>[
            
            Positioned(
              bottom: 72,
              right: 32,
              child: ClipPath(
                clipper: ClipPlus(),
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 1,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 80,
              left: 80,
              child: Container(
                width: 140,
                height: 80,
                child: Icon(
                  Icons.fingerprint,
                  size: 45,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.green[300]),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(1.0, 3.0),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 75,
              right: 35,
              child: ClipPath(
                clipper: ClipPlus(),
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset(1.0, 3.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Positioned(
              top: 20,
              left: 100,
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  // borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 180,
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  // borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPlus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 3, 0.0);
    path.lineTo(size.width / 3, size.height / 3);
    path.lineTo(0.0, size.height / 3);
    path.lineTo(0.0, 2 * (size.height / 3));
    path.lineTo(size.width / 3, 2 * (size.height / 3));
    path.lineTo(size.width / 3, size.height);
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height));
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height / 3));
    path.lineTo((size.width), 2 * (size.height / 3));
    path.lineTo((size.width), (size.height / 3));
    path.lineTo(2 * (size.width / 3), (size.height / 3));
    path.lineTo(2 * (size.width / 3), 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
