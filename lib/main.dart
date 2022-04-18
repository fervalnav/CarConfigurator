import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:flutter/material.dart';
import 'views/main.dart';
import 'views/buy.dart';
import 'views/model_selection.dart';
import 'views/selection.dart';
import 'models/option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarConfigurator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      // Especificamos las rutas para la navegacion en la app
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: "Home"),
        "/nueva_compra": (context) => BuyPage(title: "Compra", carConfiguration: newConfiguration),
        "/seleccion_modelo": (context) => ModelList()
      },
    );
  }
}

CarConfiguration newConfiguration = CarConfiguration(
  "Nueva configuracion",
  modelOptions.first,
  colorOptions.first,
  tapiceriaOptions.first
);

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
