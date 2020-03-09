import 'package:flutter/material.dart';

class PokeInfo extends StatefulWidget {
  final Color pokeColor;
  final int pokeNumber;

  const PokeInfo({Key key, this.pokeColor, this.pokeNumber}) : super(key: key);
  @override
  _PokeInfoState createState() => _PokeInfoState();
}

class _PokeInfoState extends State<PokeInfo> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width * 0.91;
    double heightSize = MediaQuery.of(context).size.height * 0.848;
    return ClipPath(
      clipper: ClipScreen(),
      child: Container(
        width: widthSize,
        height: heightSize,
        decoration: BoxDecoration(
          // color: Color(0xffE51D20),
          color: Colors.green,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: widthSize * 0.015,
              top: heightSize * 0.015,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: heightSize * 0.23,
                  height: heightSize * 0.23,
                  child: Image.asset("assets/pokeball.png"),
                ),
              ),
            ),
            Positioned(
              left: widthSize * 0.11,
              top: heightSize * 0.05,
              child: Text(
                "Quem é",
                style: TextStyle(
                    fontSize: 35, fontFamily: "Pokemon", color: Colors.yellow),
              ),
            ),
            Positioned(
              left: widthSize * 0.2,
              top: heightSize * 0.12,
              child: Text(
                "esse Pokémon?",
                style: TextStyle(
                    fontSize: 35, fontFamily: "Pokemon", color: Colors.yellow),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: heightSize * 0.474,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(heightSize * 0.035),
                    topRight: Radius.circular(heightSize * 0.035),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: heightSize * 0.245),
              child: Container(
                // color: Colors.amber,
                width: widthSize,
                height: heightSize * 0.245,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: heightSize * 0.245,
                        height: heightSize * 0.245,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.black),
                            ),
                        child: Opacity(
                          opacity: 1,
                          child: Image.asset('assets/001.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.1,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "#001",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.125,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                                // border:
                                //     Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Not\nCaptured!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Pokemon",
                                      color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: widthSize * 0.256,
                        height: heightSize * 0.125,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.red),
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Type",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: widthSize * 0.18,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Grass",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: widthSize * 0.18,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Poison",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: heightSize * 0.49),
              child: Container(
                width: widthSize,
                // color: Colors.blue,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: heightSize * 0.245,
                        decoration: BoxDecoration(
                            // color: Colors.green[800],
                            // border: Border.all(width: 1, color: Colors.black),
                            ),
                        child: Text(
                          "— Bulbasaur —",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: heightSize * 0.05, bottom: heightSize * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.green[800],
                              // border: Border.all(width: 1, color: Colors.red),
                              ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Base Stats",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w900),
                              ),
                              Padding(
                                padding: EdgeInsets.all(heightSize * 0.01),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border:
                                    //     Border.all(width: 3, color: Colors.black),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "HP",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Attack",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Defense",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Sp Attack",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Sp Defense",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Speed",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "   45",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Text(
                                                    "49",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Text(
                                                    "49",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Text(
                                                    "65",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Text(
                                                    "65",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  Text(
                                                    "45",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5 * 0.45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5 * 0.49,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5 * 0.49,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5 * 0.65,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  height: heightSize * 0.02,
                                                  width: widthSize * 0.5 * 0.65,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border(
                                                      top: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      bottom: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          width: 0.5,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Stack(
                                            children: <Widget>[
                                              Container(
                                                height: heightSize * 0.02,
                                                width: widthSize * 0.5,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black)),
                                              ),
                                              Container(
                                                height: heightSize * 0.02,
                                                width: widthSize * 0.5 * 0.45,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  border: Border(
                                                    top: BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black),
                                                    bottom: BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black),
                                                    left: BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipScreen extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // path.lineTo(0.0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, size.height * 0.1);
    // path.lineTo(size.width * 0.62, size.height * 0.1);
    // path.lineTo(size.width * 0.46, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.11);
    path.lineTo(size.width * 0.59, size.height * 0.11);
    path.lineTo(size.width * 0.41, size.height * 0.01);
    path.lineTo(0.0, size.height * 0.01);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
