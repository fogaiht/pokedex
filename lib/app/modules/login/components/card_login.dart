import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/components/state_button.dart';
import '../../../utils/form_controller.dart';
import '../login_controller.dart';

class CardLogin extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final String assetLogoPath;
  final String heroLogoTag;
  final String fontFamily;
  final String signUpRoute;
  final double heightSize;
  final double widthSize;

  const CardLogin({
    Key key,
    @required this.primaryColor,
    @required this.secondaryColor,
    this.assetLogoPath,
    this.heroLogoTag,
    this.fontFamily,
    this.signUpRoute,
    this.heightSize,
    this.widthSize,
  }) : super(key: key);

  @override
  _CardLoginState createState() => _CardLoginState();
}

class _CardLoginState extends State<CardLogin> {
  LoginController controller = Modular.get();
  FormController _formController;

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void didChangeDependencies() {
    _formController = FormController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    double _heightSize = MediaQuery.of(context).size.height;
    return Transform.scale(
      scale: 0.95,
      child: Container(
        decoration: BoxDecoration(color: Color(0x00343131), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Hero(
                tag: "logoworkplayer",
                child: Image.asset(
                  "assets/FogaihtDev.png",
                  fit: BoxFit.contain,
                  width: (_widthSize * 0.4),
                  height: (_heightSize * 0.1),
                ),
              ),
            ),
            Form(
              key: _formController.key,
              child: Column(
                children: <Widget>[
                  Container(
                    width: widget.widthSize,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                          color: widget.primaryColor,
                          fontFamily: widget.fontFamily,
                        ),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return _textFormField(
                          onChanged: controller.setEmail,
                          currentFocus: _emailNode,
                          nextFocus: _passwordNode,
                          keyboardType: TextInputType.emailAddress,
                          errorText: controller.validateEmail);
                    },
                  ),
                  Container(
                    width: widget.widthSize,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 16.0),
                      child: Text(
                        "Senha",
                        style: TextStyle(
                          color: widget.primaryColor,
                          fontFamily: widget.fontFamily,
                        ),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return _textFormField(
                          onChanged: controller.setPassword,
                          currentFocus: _passwordNode,
                          keyboardType: TextInputType.visiblePassword,
                          errorText: controller.validatePassword);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (_) {
//                    return _stateButton(controller.subState);
                        return StateButton(
                            subState: controller.subState,
                            secondaryColor: widget.secondaryColor,
                            primaryColor: widget.primaryColor,
                            textLabel: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: widget.secondaryColor,
                                  fontFamily: widget.fontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900),
                            ),
                            functionResult: () => controller.signIn(() {
                                  Modular.to.pushReplacementNamed("/home");
                                })
                            // functionResult: () => controller.signInDev(() {Modular.to.pushReplacementNamed("/home");})
                            );

//                      return _stateButton(state: controller.subState, controller: controller, context: context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: GestureDetector(
                      onTap: () => Modular.to.pushNamed(widget.signUpRoute),
                      child: Center(
                        child: Text(
                          'Não tem conta? Clique aqui',
                          style: TextStyle(
                            color: widget.primaryColor,
                            fontFamily: widget.fontFamily,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textFormField({
    String labelText,
    onFinished,
    onChanged,
    String Function() errorText,
    currentFocus,
    nextFocus,
    keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: widget.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: widget.widthSize * 0.8,
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                obscureText: keyboardType == TextInputType.visiblePassword ? controller.obscureText : false,
                keyboardType: keyboardType,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                focusNode: currentFocus,
                textInputAction: TextInputAction.next,
//      validator: keyboardType == TextInputType.visiblePassword ? (_) => controller.checkPassEmpty() : (_) => controller.checkEmailEmpty(),
                onFieldSubmitted: (_) {
                  if (nextFocus != null) {
                    FocusScope.of(context).requestFocus(nextFocus);
                  } else {
                    controller.signIn(() {
                      Modular.to.pushReplacementNamed("/home");
                    });
                  }
                },
                onChanged: onChanged,
                cursorColor: widget.primaryColor,
                style: TextStyle(
                  color: widget.primaryColor,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.secondaryColor,
                    contentPadding: EdgeInsets.all(12.0),
//        prefixIcon: keyboardType == TextInputType.emailAddress ? Icon(Icons.alternate_email) : Icon(Icons.lock_outline),
                    suffixIcon: keyboardType == TextInputType.visiblePassword
                        ? Observer(builder: (_) {
                            return IconButton(
                              icon: controller.obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                              onPressed: controller.changeVisibility,
                            );
                          })
                        : null,
                    labelText: labelText,
                    labelStyle: TextStyle(color: widget.primaryColor),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.primaryColor),
                    ),
                    errorText: errorText != null ? errorText() : null,
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
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
