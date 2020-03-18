import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_controller.dart';
import 'package:poke_api/app/utils/form_controller.dart';

import 'components/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  FormController _formController;

  final FocusNode _nameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  @override
  void didChangeDependencies() {
    _formController = FormController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;

    Color primaryColor = Colors.red;
    Color secondaryColor = Colors.white;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SignUpForm(
              
            )
          ),
        ),
      ),
    );
  }

  _textField({
    String labelText,
    onFinished,
    onChanged,
    onSubmit,
    String Function() errorText,
    currentFocus,
    nextFocus,
    keyboardType,
    Color primaryColor,
    Color secondaryColor,
    double widthSize,
    double heightSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: widthSize * 0.8,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                obscureText: keyboardType == TextInputType.visiblePassword
                    ? controller.visibility
                    : false,
                keyboardType: keyboardType,
                focusNode: currentFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  if (nextFocus != null) {
                    _fieldFocusChange(context, currentFocus, nextFocus);
                  } else {
                    onSubmit();
                  }
                },
                onChanged: onChanged,
                cursorColor: primaryColor,
                style: TextStyle(
                  color: primaryColor,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor,
                    contentPadding: EdgeInsets.all(12.0),
//        prefixIcon: keyboardType == TextInputType.emailAddress ? Icon(Icons.alternate_email) : Icon(Icons.lock_outline),
                    suffixIcon: keyboardType == TextInputType.visiblePassword
                        ? IconButton(
                            icon: controller.visibility
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: controller.changeVisibility,
                          )
                        : null,
                    labelText: labelText,
                    labelStyle: TextStyle(color: primaryColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    errorText: errorText != null ? errorText() : null,
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 0.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    errorStyle: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
