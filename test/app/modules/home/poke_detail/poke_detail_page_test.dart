import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:poke_api/app/modules/home/poke_detail/poke_detail_page.dart';

main() {
  testWidgets('PokeDetailPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PokeDetailPage(title: 'PokeDetail')));
    final titleFinder = find.text('PokeDetail');
    expect(titleFinder, findsOneWidget);
  });
}
