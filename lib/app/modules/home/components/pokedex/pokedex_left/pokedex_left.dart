// import 'package:flutter/material.dart';
// import 'package:poke_api/app/modules/home/poke_screen/poke_screen_module.dart';
// import 'package:poke_api/app/modules/home/poke_screen/poke_screen_page.dart';
// import 'poke_join_left.dart';
// import 'pokedex_bottom.dart';
// import 'pokedex_header.dart';
// import 'pokedex_screen.dart';

// class PokedexLeft extends StatefulWidget {
//   @override
//   _PokedexLeftState createState() => _PokedexLeftState();
// }

// List<String> cardGenerate = List<String>.generate(30, (i) {
//   return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${i + 1}.png";
// });
// int selectedCard = 0;
// onRightClick() {
//   if (selectedCard < cardGenerate.length-1) {
//     selectedCard += 1;
//     print(selectedCard);
//   } else {
//     print("Total de Pokemons: $selectedCard");
//   }
// }

// class _PokedexLeftState extends State<PokedexLeft> {
//   @override
//   Widget build(BuildContext context) {
//     double widthSize = MediaQuery.of(context).size.width;
//     double heightSize = MediaQuery.of(context).size.height;
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: heightSize * 0.025,
//             child: PokedexHeader(),
//           ),
//           Positioned(
//             top: heightSize * 0.233,
//             // child: PokedexScreen(pokeNumber: selectedCard,),
//             child: PokedexHeader()
//           ),
//           Positioned(
//             bottom: heightSize * 0.025,
//             child: PokedexBottom(
//               onLeftTap: () {
//                 print("Left Tap");
//               },
//               onRightTap: () {
//                 onRightClick();
//                 print("Right Tap");
//               },
//             ),
//           ),
//           Positioned(
//             bottom: heightSize * 0.025,
//             right: 0,
//             child: PokejoinLeft(),
//           ),
//         ],
//       ),
//     );
//   }
// }
