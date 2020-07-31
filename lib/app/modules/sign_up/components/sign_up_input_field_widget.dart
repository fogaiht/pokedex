import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../sign_up_controller.dart';

class SignUpInputField extends StatefulWidget {
  final SignUpController controller;

  const SignUpInputField(this.controller, {Key key}) : super(key: key);
  @override
  _SignUpInputFieldState createState() => _SignUpInputFieldState();
}

class _SignUpInputFieldState extends State<SignUpInputField> {
  final FocusNode _nameNode = FocusNode();
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
                  'Nome',
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: widget.controller.store.setName,
                    focusNode: _nameNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_emailNode),
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: widget.controller.validators.formError.attributes["name"],
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
              SizedBox(height: 5),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: widget.controller.store.setEmail,
                    focusNode: _emailNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: widget.controller.validators.formError.attributes["email"],
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
                    onFieldSubmitted: (_) => widget.controller.createUser(),
                    cursorColor: Colors.black,
                    obscureText: !widget.controller.store.visibility,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                      errorText: widget.controller.validators.formError.attributes["password"],
                      suffixIcon: InkWell(
                        onTap: widget.controller.store.changeVisibility,
                        child: Icon(
                          widget.controller.store.visibility ? Icons.visibility : Icons.visibility_off,
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
