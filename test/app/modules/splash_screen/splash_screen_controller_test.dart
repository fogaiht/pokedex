import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:poke_api/app/modules/splash_screen/splash_screen_module.dart';

void main() {
  initModule(SplashScreenModule());
  SplashScreenController splashscreen;

  setUp(() {
    splashscreen = SplashScreenModule.to.get<SplashScreenController>();
  });

  group('SplashScreenController Test', () {
    test("First Test", () {
      expect(splashscreen, isInstanceOf<SplashScreenController>());
    });

    test("Set Value", () {
      expect(splashscreen.value, equals(0));
      splashscreen.increment();
      expect(splashscreen.value, equals(1));
    });
  });
}
