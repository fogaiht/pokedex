import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../sub_states.dart';

class StateButton extends StatelessWidget {
  final SubState subState;
  final Function onTap;
  final Text textLabel;
  final double borderRadius;
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final Color colorText;
  final Color colorStart;
  final Color colorError;
  final Color colorLoading;
  final Color colorSuccess;
  final Widget childStart;
  final Widget childError;
  final Widget childLoading;
  final Widget childSuccess;

  StateButton({
    Key key,
    @required this.subState,
    @required this.onTap,
    this.textLabel,
    this.colorText,
    this.colorStart,
    this.colorError,
    this.colorLoading,
    this.colorSuccess,
    this.childStart,
    this.childError,
    this.childLoading,
    this.childSuccess,
    @required this.primaryColor,
    @required this.secondaryColor,
    this.borderColor = Colors.transparent,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        if (subState == SubState.loading) {
          return _subStateLoginButton(
              color: primaryColor,
              child: SpinKitRing(
                color: secondaryColor,
                lineWidth: 3.0,
                size: 30,
              ),
              width: 50,
              borderRadius: 30);
        } else if (subState == SubState.success) {
          return _subStateLoginButton(
              color: Colors.transparent,
              child: Icon(
                Icons.check,
                color: primaryColor,
                size: 40,
              ),
              width: 50,
              borderRadius: 30);
        } else if (subState == SubState.error) {
          return _subStateLoginButton(
              color: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
              width: 50,
              borderRadius: 30);
        } else {
          return _subStateLoginButton(
              color: primaryColor,
              child: Center(
                child: textLabel,
              ),
              width: MediaQuery.of(context).size.width * 0.45,
              borderRadius: 30);
        }
      },
    );
  }

  _subStateLoginButton(
      {Color color, Widget child, double width, double borderRadius}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: AnimatedContainer(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 3),
              borderRadius: BorderRadius.circular(borderRadius),
              color: color,
            ),
            duration: Duration(milliseconds: 250),
            child: child),
        onTap: onTap,
      ),
    );
  }
}
