import 'package:flutter/material.dart';

class PokejoinLeft extends StatefulWidget {
  @override
  _PokejoinLeftState createState() => _PokejoinLeftState();
}

class _PokejoinLeftState extends State<PokejoinLeft> {
  @override
  Widget build(BuildContext context) {
    // double widthSize = MediaQuery.of(context).size.width * 0.1;
    double widthSize = MediaQuery.of(context).size.width * 0.05;
    double heightSize = MediaQuery.of(context).size.height * 0.78;
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(heightSize * 0.045),
          bottomLeft: Radius.circular(heightSize * 0.045),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: heightSize * 0.09,
            child: Container(
              width: widthSize,
              height: heightSize * 0.015,
              color: Colors.red[900],
            ),
          ),
          Positioned(
            bottom: heightSize * 0.09,
            child: Container(
              width: widthSize,
              height: heightSize * 0.015,
              color: Colors.red[900],
            ),
          ),
        ],
      ),
    );
  }
}
