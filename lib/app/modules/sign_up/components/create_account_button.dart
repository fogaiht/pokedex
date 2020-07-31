import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../utils/components/state_button.dart';
import '../sign_up_controller.dart';

class CreateAccountButton extends StatelessWidget {
  final SignUpController controller;

  const CreateAccountButton(this.controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              StateButton(
                subState: controller.store.subState,
                secondaryColor: Color(0xffffffff),
                primaryColor: Colors.red,
                textLabel: Text(
                  "CRIAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: controller.createUser,
              ),
            ],
          );
        },
      ),
    );
  }
}
