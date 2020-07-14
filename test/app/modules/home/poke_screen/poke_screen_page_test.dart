import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:poke_api/app/modules/home/poke_screen/poke_screen_page.dart';

main() {
  testWidgets('PokeScreenPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PokeScreenPage(title: 'PokeScreen')));
    final titleFinder = find.text('PokeScreen');
    expect(titleFinder, findsOneWidget);
  });
}
