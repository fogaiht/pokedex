import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => Modular.to.pushNamed("/signup"),
        child: Center(
          child: Text(
            'Não tem conta? Clique aqui',
            style: TextStyle(
              color: Colors.red,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
