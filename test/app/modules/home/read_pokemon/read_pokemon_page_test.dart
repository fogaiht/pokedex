import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_pokedex/app/modules/home/read_pokemon/read_pokemon_page.dart';

main() {
  testWidgets('ReadPokemonPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ReadPokemonPage(title: 'ReadPokemon')));
    final titleFinder = find.text('ReadPokemon');
    expect(titleFinder, findsOneWidget);
  });
}
