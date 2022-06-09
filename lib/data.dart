import 'models/car_configuration.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:CarConfigurator/models/modelo.dart';
import 'package:CarConfigurator/models/color.dart';
import 'package:CarConfigurator/models/tapiceria.dart';
import 'package:CarConfigurator/models/extra.dart';

/// TODO -- esto deberia ir guardado en otro lugar!
List<Modelo> modelos = [
  Modelo(id: 1, nombre: "Model 3", precio: 23000),
  Modelo(id: 2, nombre: "Model Y", precio: 25000),
  Modelo(id: 3, nombre: "Model S", precio: 40000),
  Modelo(id: 4, nombre: "Model X", precio: 30000),
];
List<String> modelImages = [
  "images/modelo_1.png",
  "images/modelo_2.png",
  "images/modelo_3.png",
  "images/modelo_4.png"
];

List<Color> colors = [
  Color(id: 1, nombre: "Blanco", precio: 0),
  Color(id: 2, nombre: "Negro", precio: 10),
  Color(id: 3, nombre: "Rojo", precio: 20),
  Color(id: 4, nombre: "Azul", precio: 20),
];
List<String> colorImages = [
  "images/color_1.png",
  "images/color_2.png",
  "images/color_3.png",
  "images/color_4.png"
];

List<Tapiceria> tapicerias = [
  Tapiceria(id: 1, nombre: "Deportivo", precio: 200),
  Tapiceria(id: 2, nombre: "Cuero", precio: 100),
];
List<String> tapiceriaImages = [
  "images/tapiceria_1.png",
  "images/tapiceria_2.png"
];

List<Extra> extras = [
  Extra(id: 1, nombre: "Altavoces", precio: 200),
  Extra(id: 2, nombre: "Pantalla", precio: 500),
];
List<String> extrasImages = [
  "images/extra_1.png",
  "images/extra_2.png"
];

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