import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../login_controller.dart';
import 'login_input_field_widget.dart';

class LoginInputData extends StatelessWidget {
  final LoginController controller;

  const LoginInputData(this.controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: LoginInputField(controller),
            ),
            Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Observer(builder: (_) {
                      return Checkbox(
                        value: controller.store.rememberMe,
                        onChanged: controller.store.changeRemember,
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                      );
                    }),
                    Text(
                      'Lembre-se de mim',
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
