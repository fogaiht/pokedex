import 'package:flutter/material.dart';

class PokeDetailPage extends StatefulWidget {
  final String title;
  const PokeDetailPage({Key key, this.title = "PokeDetail"}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
