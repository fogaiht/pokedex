import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../login_controller.dart';

class LoginInputField extends StatefulWidget {
  final LoginController controller;

  const LoginInputField(this.controller, {Key key}) : super(key: key);
  @override
  _LoginInputFieldState createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // double widthSize = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: widget.controller.store.setEmail,
                    focusNode: _emailNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordNode),
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: widget
                          .controller.validators.formError.attributes["email"],
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Senha',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    onChanged: widget.controller.store.setPassword,
                    focusNode: _passwordNode,
                    onFieldSubmitted: (_) => widget.controller.signIn(),
                    cursorColor: Colors.black,
                    obscureText: !widget.controller.store.showPassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                      errorText: widget.controller.validators.formError
                          .attributes["password"],
                      suffixIcon: InkWell(
                        onTap: widget.controller.store.changeVisibility,
                        child: Icon(
                          widget.controller.store.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
