import 'dart:math';

import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  final Function firstOnTap;
  final Function secondOnTap;
  final Color primaryColor;
  final Color secondaryColor;
  final Text firstText;
  final Text secondText;
  final IconData faceIcon;
  final IconData firstOptionIcon;
  final IconData secondOptionIcon;
  SettingsMenu(
      {Key key,
      @required this.firstOnTap,
      @required this.secondOnTap,
      this.primaryColor = Colors.white,
      this.secondaryColor = Colors.black,
      this.firstText,
      this.secondText,
      this.firstOptionIcon,
      this.secondOptionIcon,
      this.faceIcon})
      : super(key: key);

  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> openAnimation;
  Animation<double> openItemsAnimation;
  Animation<double> openTextAnimation;
  Animation<Color> btnColor;
  Animation<Color> btnIconColor;

  bool isOpen = false;

  @override
  void didChangeDependencies() {
    openAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0, 0.5, curve: Curves.easeInQuad)));

    openItemsAnimation = Tween<double>(
      begin: 0.0,
      end: 70.0,
    ).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0.5, 1, curve: Curves.easeInQuad)));

    openTextAnimation = Tween<double>(
      begin: 250.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0.5, 1, curve: Curves.easeInQuad)));

    btnColor = ColorTween(
      begin: widget.primaryColor,
      end: widget.secondaryColor,
      // begin: Colors.white,
      // end: Color(0xff7e23d9),
    ).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0, 1, curve: Curves.easeInQuad)));

    btnIconColor = ColorTween(
      begin: widget.secondaryColor,
      end: widget.primaryColor,
    ).animate(CurvedAnimation(
        parent: animController,
        curve: Interval(0, 1, curve: Curves.easeInQuad)));

    super.didChangeDependencies();
  }

  @override
  void initState() {
    animController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
    super.initState();
  }

  openOption() {
    if (!isOpen) {
      animController.forward();
      setState(() {
        isOpen = !isOpen;
      });
    } else {
      animController.reverse();
      setState(() {
        isOpen = !isOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      // color: Colors.green,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: AnimatedBuilder(
                animation: animController,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0, openItemsAnimation.value),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(openTextAnimation.value, 0),
                          child: widget.firstText,
                        ),
                        Transform.scale(
                          scale: 0.75,
                          child: FloatingActionButton(
                            heroTag: "firstButton",
                            backgroundColor: btnIconColor.value,
                            onPressed: widget.firstOnTap,
                            child: Icon(
                              widget.firstOptionIcon,
                              color: btnColor.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AnimatedBuilder(
                animation: animController,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0, openItemsAnimation.value * 1.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AnimatedBuilder(
                            animation: openTextAnimation,
                            builder: (context, snapshot) {
                              return Transform.translate(
                                offset: Offset(openTextAnimation.value, 0),
                                child: widget.secondText,
                              );
                            }),
                        Transform.scale(
                          scale: 0.75,
                          child: FloatingActionButton(
                            heroTag: "secondButton",
                            onPressed: widget.secondOnTap,
                            backgroundColor: btnIconColor.value,
                            child: Icon(
                              widget.secondOptionIcon,
                              color: btnColor.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AnimatedBuilder(
              animation: animController,
              builder: (context, snapshot) {
                final angle = openAnimation.value;
                return Transform.rotate(
                  angle: -pi * angle,
                  child: Transform.scale(
                    scale: 0.8,
                    child: FloatingActionButton(
                      heroTag: "faceButton",
                      // backgroundColor: Color(0xff7e23d9),
                      backgroundColor: btnColor.value,
                      onPressed: () {
                        openOption();
                        print("Options Oppened: $isOpen");
                        // Modular.to.pushReplacementNamed('/login');
                        // controller.logout();
                      },
                      child: Icon(
                        openAnimation.value <= 0.5
                            ? widget.faceIcon
                            : Icons.close,
                        color: btnIconColor.value,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
