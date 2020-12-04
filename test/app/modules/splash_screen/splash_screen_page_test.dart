import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_pokedex/app/modules/splash_screen/splash_screen_page.dart';

main() {
  testWidgets('SplashScreenPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SplashScreenPage(title: 'SplashScreen')));
    final titleFinder = find.text('SplashScreen');
    expect(titleFinder, findsOneWidget);
  });
}
