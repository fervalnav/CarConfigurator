import 'models/car_configuration.dart';
import 'models/option.dart';

/// TODO -- esto deberia ir guardado en otro lugar!
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

// ------------------------------------------------------------------
//
final List<String> imagesConfigView = <String>[
  "images/pruebas.jpg",
  "images/paleta_colores.jpg",
  "images/tapiceria.jpg",
  "images/extras.jpg"
];

final List<String> footerImagesConfigView = <String>[
  "Modelo",
  "Colores",
  "Tapiceria",
  "Extras"
];

final List<List<Option>> optionsConfigView = <List<Option>>[
  modelOptions,
  colorOptions,
  tapiceriaOptions,
  extrasOptions
];