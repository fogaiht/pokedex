import 'package:flutter/material.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_left/pokedex_left.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/pokedex_right.dart';
import 'package:poke_api/app/utils/components/infinity_page_view.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InfinityPageController pageController = InfinityPageController();
  PageController pageViewController = PageController();

  @override
  void initState() {
    pageController = InfinityPageController(initialPage: 0);
  pageViewController = PageController(initialPage:1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: pageViewController,
            scrollDirection: Axis.horizontal,
            reverse: false,
            children: <Widget>[
              PokedexLeft(),
              PokedexRight(),
            ],
          ),
        ),
      ),
    );
  }
}
