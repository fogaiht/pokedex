import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:poke_api/app/modules/home/home_page.dart';

main() {
  testWidgets('HomePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}
