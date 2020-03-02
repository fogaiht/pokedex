import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomControlDoing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Container(
        height: 220,
        width: largura,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xffadadad),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),
            ),
            Text(
              "O que deseja fazer com essa atividade?",
              style: TextStyle(
                color: Color(0xff797979),
                fontSize: 15,
                fontWeight: FontWeight.w300
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkResponse(
                      radius: 60,
                      onTap: () {},
                      child: Container(
                        width: largura*0.25,
                        height: largura*0.25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffe9e514),
                                  Color(0xffa3a171)
                                ]
                            )
                        ),
                        child: Center(
                          child: Text("Suspender", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    InkResponse(
                      onTap: () {},
                      radius: 75,
                      child: Container(
                        width: largura*0.3,
                        height: largura*0.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff19ed26),
                                  Color(0xff76a173)
                                ]
                            )
                        ),
                        child: Center(
                          child: Text("Finalizar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    InkResponse(
                      onTap: (){},
                      radius: 60,
                      child: Container(
                        width: largura*0.25,
                        height: largura*0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffef1854),
                              Color(0xffa1737e)
                            ]
                          )
                        ),
                        child: Center(
                          child: Text("Devolver", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
