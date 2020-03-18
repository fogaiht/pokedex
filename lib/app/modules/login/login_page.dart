import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/login/components/card_login.dart';
import 'package:poke_api/app/modules/login/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

printa() {
  print("object");
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widthSize,
                    height: widthSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(1000)
                    ),
                    child: CardLogin(
                      fontFamily: "Montserrat",
                      primaryColor: Colors.red,
                      secondaryColor: Colors.white,
                      signUpRoute: "/signup",
                      widthSize: widthSize,
                      heightSize: widthSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
