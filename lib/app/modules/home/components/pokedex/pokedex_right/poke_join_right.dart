import 'package:flutter/material.dart';

class PokejoinRight extends StatefulWidget {
  @override
  _PokejoinRightState createState() => _PokejoinRightState();
}

class _PokejoinRightState extends State<PokejoinRight> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Container(
      width: widthSize * 0.05,
      // width: 20,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(color: Colors.red[900], height: heightSize * 0.02),
                SizedBox(height: heightSize * 0.001),
                SizedBox(height: heightSize * 0.001),
                SizedBox(height: heightSize * 0.001),
                SizedBox(height: heightSize * 0.001),
                SizedBox(height: heightSize * 0.001),
                Container(color: Colors.red[900], height: heightSize * 0.02)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
