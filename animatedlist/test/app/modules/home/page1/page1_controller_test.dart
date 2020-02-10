import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:animatedlist/app/modules/home/page1/page1_controller.dart';
import 'package:animatedlist/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  Page1Controller page1;

  setUp(() {
    page1 = HomeModule.to.get<Page1Controller>();
  });

  group('Page1Controller Test', () {
    test("First Test", () {
      expect(page1, isInstanceOf<Page1Controller>());
    });

    test("Set Value", () {
      expect(page1.value, equals(0));
      page1.increment();
      expect(page1.value, equals(1));
    });
  });
}
