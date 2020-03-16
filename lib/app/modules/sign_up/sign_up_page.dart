import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_controller.dart';
import 'package:poke_api/app/utils/components/state_button.dart';
import 'package:poke_api/app/utils/components/text_form_field.dart';
import 'package:poke_api/app/utils/form_controller.dart';
import 'package:poke_api/app/utils/sub_states.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  FormController _formController;

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formController.key,
        child: Column(
          children: <Widget>[
            Container(
              width: widthSize,
              child: Padding(
                padding: EdgeInsets.only(left: widthSize * 0.1),
                child: Text(
                  "Nome",
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return CustomTextFormField(
                onChanged: controller.setPassword,
                currentFocus: _passwordNode,
                keyboardType: TextInputType.visiblePassword,
                errorText: controller.validatePassword,
                widthSize: widthSize,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
              );
            }),
            Container(
              width: widthSize,
              child: Padding(
                padding: EdgeInsets.only(left: widthSize * 0.1),
                child: Text(
                  "E-mail",
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return CustomTextFormField(
                onChanged: controller.setPassword,
                currentFocus: _passwordNode,
                keyboardType: TextInputType.visiblePassword,
                errorText: controller.validatePassword,
                widthSize: widthSize,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
              );
            }),
            Container(
              width: widthSize,
              child: Padding(
                padding: EdgeInsets.only(left: widthSize * 0.1),
                child: Text(
                  "Senha",
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return CustomTextFormField(
                onChanged: controller.setPassword,
                currentFocus: _passwordNode,
                keyboardType: TextInputType.visiblePassword,
                errorText: controller.validatePassword,
                widthSize: widthSize,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
              );
            }),
            Container(
              width: widthSize,
              child: Padding(
                padding: EdgeInsets.only(left: widthSize * 0.1),
                child: Text(
                  "Confirme sua Senha",
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return CustomTextFormField(
                onChanged: controller.setPassword,
                currentFocus: _passwordNode,
                keyboardType: TextInputType.visiblePassword,
                errorText: controller.validatePassword,
                widthSize: widthSize,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
              );
            }),
            Observer(builder: (_) {
              return StateButton(
                subState: controller.subState,
                functionResult: () {
                  print("object");
                  controller.setSubState(SubState.error);
                },
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                textLabel: Text(
                  "Confirmar",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: secondaryColor,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
