import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/create_account_button.dart';
import 'components/sign_up_input_field_widget.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
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
    // double widthSize = MediaQuery.of(context).size.width;
    // double heightSize = MediaQuery.of(context).size.height;

    Color primaryColor = Colors.white;
    // Color secondaryColor = Colors.white;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "Criar Conta",
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SignUpInputField(controller),
                  ),
                ),
                CreateAccountButton(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
