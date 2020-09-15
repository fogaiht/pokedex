import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:super_qr_reader/super_qr_reader.dart';

import '../../../home_controller.dart';

class PokedexBottom extends StatefulWidget {
  final Function onRightTap;
  final Function onLeftTap;

  final HomeController homeController;

  const PokedexBottom({Key key, this.onRightTap, this.onLeftTap, this.homeController}) : super(key: key);
  @override
  _PokedexBottomState createState() => _PokedexBottomState();
}

class _PokedexBottomState extends State<PokedexBottom> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height * 0.23;

    return Container(
      height: heightSize,
      width: widthSize,
      decoration: BoxDecoration(
          color: Color(0xffE51D20),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(heightSize * 0.125),
            bottomLeft: Radius.circular(heightSize * 0.125),
          )),
      child: Stack(
        children: <Widget>[
          Positioned(
            // bottom: heightSize * 0.3,
            top: heightSize * 0.01,
            right: widthSize * 0.1,
            child: ClipPath(
              clipper: ClipPlus(),
              child: Container(
                width: widthSize * 0.317,
                height: widthSize * 0.317,
                decoration: BoxDecoration(
                  color: Colors.black,
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 5.0,
                  //     offset: Offset(1.0, 3.0),
                  //   ),
                  // ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.3,
            // top: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: heightSize,
                  width: widthSize,
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            // bottom: heightSize * 0.314,
            right: widthSize * 0.106,
            child: ClipPath(
              clipper: ClipPlus(),
              child: Container(
                width: widthSize * 0.317,
                height: widthSize * 0.317,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          Positioned(
            top: widthSize * 0.106,
            right: widthSize * 0.106,
            child: GestureDetector(
              onTap: widget.homeController.store.increment,
              child: Container(
                width: widthSize * 0.106,
                height: widthSize * 0.106,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: widthSize * 0.106,
                )),
              ),
            ),
          ),
          Positioned(
            top: widthSize * 0.106,
            right: widthSize * 0.106 * 3,
            child: GestureDetector(
              onTap: widget.homeController.store.decrement,
              child: Container(
                width: widthSize * 0.106,
                height: widthSize * 0.106,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: widthSize * 0.106,
                )),
              ),
            ),
          ),
          Positioned(
            bottom: heightSize * 0.4,
            left: widthSize * 0.253,
            child: GestureDetector(
              onTap: () async {
                String results = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScanView(
                      cornerColor: Colors.red,
                    ),
                  ),
                );

                if (results != null) {
                  widget.homeController.addPokemon(results);
                }
              },
              child: Container(
                width: widthSize * 0.286,
                height: heightSize * 0.37,
                child: Icon(
                  MdiIcons.qrcode,
                  size: heightSize * 0.236,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.green[300]),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(1.0, 3.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: widthSize * 0.106,
            top: 0,
            child: GestureDetector(
              onTap: () {
                var pokemonIndex = widget.homeController.store.screenIndex;
                var userPokemonList = widget.homeController.store.user.pokemonList;
                if (pokemonIndex >= 0) {
                  widget.homeController.store.selectPokemon(userPokemonList[pokemonIndex]);
                  print(widget.homeController.store.selectedPokemon);
                  widget.homeController.pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
                // scan();
              },
              child: Container(
                height: heightSize * 0.236,
                width: heightSize * 0.236,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   Future scan() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       // setState(() => this.qrScan = barcode);
//       widget.homeController.addPokemon(barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         // setState(() {
//         //   this.qrScan = 'The user did not grant the camera permission!';
//         // });
//       } else {
//         // setState(() => this.qrScan = 'Unknown error: $e');
//       }
//     } on FormatException {
//       // setState(() => this.qrScan = '');
//     } catch (e) {
//       // setState(() => this.qrScan = 'Unknown error: $e');
//     }
//   }
}

class ClipPlus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 3, 0.0);
    path.lineTo(size.width / 3, size.height / 3);
    path.lineTo(0.0, size.height / 3);
    path.lineTo(0.0, 2 * (size.height / 3));
    path.lineTo(size.width / 3, 2 * (size.height / 3));
    path.lineTo(size.width / 3, size.height);
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height));
    path.lineTo(2 * (size.width / 3), size.height);
    path.lineTo(2 * (size.width / 3), 2 * (size.height / 3));
    path.lineTo((size.width), 2 * (size.height / 3));
    path.lineTo((size.width), (size.height / 3));
    path.lineTo(2 * (size.width / 3), (size.height / 3));
    path.lineTo(2 * (size.width / 3), 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
