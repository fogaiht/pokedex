import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  final Widget topChild;
  final Widget middleChild;
  final Widget bottomChild;

  PageBody({
    this.topChild,
    @required this.middleChild,
    this.bottomChild,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(child: topChild),
        Container(child: middleChild),
        Container(child: bottomChild),
      ],
    );
  }
}