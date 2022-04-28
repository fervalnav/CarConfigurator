import 'package:CarConfigurator/models/option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CarConfigurator/backend/ActiveConfiguration.dart';

void main() {
  group("Option tests", () {
    test("create option", () {
      Option option = Option(1, "Option", 1.0, "./test.png");
      expect(option.id, 1);
      expect(option.text, "Option");
    });

    test("get Price", () {
      Option option = Option(1, "Option", 1.0, "./test.png");
      expect(option.getPrice(), 1.0);
    });
  });
}
