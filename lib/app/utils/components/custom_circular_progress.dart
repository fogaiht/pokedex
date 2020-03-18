import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x00ff0000), width: 3),
        borderRadius: BorderRadius.circular(30),
        color: Colors.red,
      ),
      duration: Duration(milliseconds: 250),
      child: SpinKitRing(
        color: Colors.white,
        lineWidth: 3.0,
        size: 30,
      ),
    );
  }
}
