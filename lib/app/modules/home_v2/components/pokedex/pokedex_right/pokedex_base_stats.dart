import 'package:flutter/material.dart';

class PokedexBaseStats extends StatefulWidget {
  

  
  @override
  _PokedexBaseStatsState createState() => _PokedexBaseStatsState();
}

class _PokedexBaseStatsState extends State<PokedexBaseStats> {
  @override
  Widget build(BuildContext context) {
    // double widthSize = widget.widthSize;
    // double heightSize = widget.heightSize;
    double widthSize = MediaQuery.of(context).size.width * 0.9;
    double heightSize = MediaQuery.of(context).size.height*0.9;
    return Container(
      height: heightSize * 0.3,
      width: widthSize,
      // color: Colors.tealAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.9,
                child: Text(
                  "Base Stats",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.03,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // color: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // color: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "HP",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                child: Text(
                  "45",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.45,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "Attack",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                child: Text(
                  "49",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.49,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "Defense",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                
                child: Text(
                  "49",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.49,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "Sp Attack",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                child: Text(
                  "65",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.65,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "Sp Defense",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                child: Text(
                  "65",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.65,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: widthSize * 0.3,
                child: Text(
                  "Speed",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.red,
              ),
              Container(
                width: widthSize * 0.2,
                child: Text(
                  "45",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: heightSize * 0.023,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // color: Colors.green,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: widthSize * 0.4,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black)),
                  ),
                  Container(
                    width: widthSize * 0.4 * 0.45,
                    height: heightSize * 0.025,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.black),
                          bottom: BorderSide(width: 0.5, color: Colors.black),
                          left: BorderSide(width: 0.5, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
