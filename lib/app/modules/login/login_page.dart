import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/login/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

printa() {
  print("object");
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller.signInDev();
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text("LOGIN")),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        controller.currentUser == null
                            ? "Todos Usuários"
                            : controller.currentUser,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller.getUsers();
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Center(child: Text("GET USERS")),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        controller.currentUser == null
                            ? "Todos Usuários"
                            : controller.currentUser,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller.addPokemon(99);
                      },
                      child: Container(
                        width: 300,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            controller.currentUser == null
                                ? "JSON USUÁRIO ATUAL"
                                : controller.currentUser,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        controller.getPokeList();
                      },
                      child: Container(
                        width: 300,
                        color: Colors.blue,
                        child: Center(
                          child: Image.network(controller.pokemonURL == null
                              ? "https://i.etsystatic.com/6081928/r/il/349da5/1748259489/il_570xN.1748259489_n3ob.jpg"
                              : controller.pokemonURL),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
