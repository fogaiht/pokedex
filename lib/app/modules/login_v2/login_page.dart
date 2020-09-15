import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'widgets/fogaihtdev_image.dart';
import 'widgets/login_button.dart';
import 'widgets/login_input_data/login_input_data.dart';
import 'widgets/signup_button.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    controller.validators.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    controller.validators.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _heightSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacer(),
              FogaihtDevImage(),
              Spacer(),
              LoginInputData(controller),
              LoginButton(controller),
              SignupButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
