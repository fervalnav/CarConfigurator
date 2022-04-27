import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CarConfigurator/backend/ActiveConfiguration.dart';

// TODO -- tomo esto de main.dart. Deberia ir en una clase separada
List<Option> modelOptions = [
  Option(1, "Model 3", 23000, "images/modelo_1.png"),
  Option(2, "Model Y", 25000, "images/modelo_2.png"),
  Option(3, "Model S", 40000, "images/modelo_3.png"),
  Option(4, "Model X", 30000, "images/modelo_4.png"),
];

List<Option> colorOptions = [
  Option(1, "Blanco", 0, "images/color_1.png"),
  Option(2, "Negro", 10, "images/color_2.png"),
  Option(3, "Rojo", 20, "images/color_3.png"),
  Option(4, "Azul", 20, "images/color_4.png"),
];

List<Option> tapiceriaOptions = [
  Option(1, "Deportivo", 200, "images/tapiceria_1.jpg"),
  Option(2, "Cuero", 100, "images/tapiceria_2.png"),
];

List<Option> extrasOptions = [
  Option(1, "Altavoces", 200, "images/extras_1.jpg"),
  Option(2, "Pantalla", 500, "images/extras_2.jpg"),
];

void main() {
  group("Active configuration tests", () {
    ActiveConfigurationRepository active = InMemoryActiveConfiguration();
    active.setConfig(CarConfiguration.origin("Test set configuration"));
    test("set active configuration", () {
      expect(active.getName(), "Test set configuration");
    });

    test("set model", () {
      active.setModel(modelOptions.first);
      expect(active.getActiveConfiguration().model.id, 1);
    });

    test("set color", () {
      active.setColor(colorOptions.last);
      expect(active.getActiveConfiguration().color.id, 4);
    });

    test("set tapiceria", () {
      active.setTapiceria(tapiceriaOptions.first);
      expect(active.getActiveConfiguration().tapiceria.id, 1);
    });

    test("add extra", () {
      expect(active.getActiveConfiguration().extras.length, 0);
      active.setExtra(extrasOptions.first);
      expect(active.getActiveConfiguration().extras.length, 1);
    });

    test("get total price", () {
      expect(active.getTotalPrice(), 23600.0);
      active.setModel(modelOptions.last);
      expect(active.getTotalPrice(), 53400.0);
    });
  });
}
