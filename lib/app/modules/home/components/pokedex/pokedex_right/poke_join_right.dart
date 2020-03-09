import 'package:flutter/material.dart';

class PokejoinRight extends StatefulWidget {
  @override
  _PokejoinRightState createState() => _PokejoinRightState();
}

class _PokejoinRightState extends State<PokejoinRight> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.05;
    // double heightSize = MediaQuery.of(context).size.height * 0.78;
    double heightSize = MediaQuery.of(context).size.height * 0.78;
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(heightSize * 0.045),
          bottomRight: Radius.circular(heightSize * 0.045),
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
