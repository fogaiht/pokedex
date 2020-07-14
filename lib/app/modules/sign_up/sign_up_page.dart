import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/sign_up_form.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  // FormController _formController;

  // final FocusNode _nameNode = FocusNode();
  // final FocusNode _emailNode = FocusNode();
  // final FocusNode _passwordNode = FocusNode();
  // final FocusNode _confirmPasswordNode = FocusNode();

  @override
  void didChangeDependencies() {
    // _formController = FormController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // double widthSize = MediaQuery.of(context).size.width;
    // double heightSize = MediaQuery.of(context).size.height;

    Color primaryColor = Colors.red;
    // Color secondaryColor = Colors.white;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(child: SignUpForm()),
        ),
      ),
    );
  }

}


