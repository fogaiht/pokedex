import 'package:flutter/material.dart';

class MiniLogoKyros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "minikyros",
      child: Image.asset(
        "assets/logo_kyros.png",
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width * 0.20,
      ),
    );
  }
}
