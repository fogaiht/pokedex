import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_pokedex/app/modules/home/profile/profile_page.dart';

main() {
  testWidgets('ProfilePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ProfilePage(title: 'Profile')));
    final titleFinder = find.text('Profile');
    expect(titleFinder, findsOneWidget);
  });
}
