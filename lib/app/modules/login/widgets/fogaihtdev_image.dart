import 'package:flutter/material.dart';

class FogaihtDevImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    return Center(
      child: Image.asset(
        "assets/FogaihtDev.png",
        fit: BoxFit.contain,
        width: (_widthSize * 0.4),
      ),
    );
  }
}
