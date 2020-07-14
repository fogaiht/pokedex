import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:poke_api/app/modules/sign_up/sign_up_page.dart';

main() {
  testWidgets('SignUpPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SignUpPage(title: 'SignUp')));
    final titleFinder = find.text('SignUp');
    expect(titleFinder, findsOneWidget);
  });
}
