import 'package:flutter/material.dart';
import 'views/main.dart';
import 'views/buy.dart';
import 'views/model_selection.dart';
import 'views/selection.dart';
import 'components/option.dart';

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
        "/nueva_compra": (context) => const BuyPage(title: "Compra"),
        "/seleccion_modelo": (context) => ModelList(),
        "/seleccion_color":(context) => Selection(title: "Seleccionar Color", options: colorOptions),
        "/seleccion_tapiceria":(context) => Selection(title: "Seleccionar Tapiceria", options: tapiceriaOptions)
      },
    );
  }
}

List<Option> colorOptions = [
  Option(1, "Blanco", "images/color_1.png"),
  Option(2, "Negro", "images/color_2.png"),
  Option(3, "Rojo", "images/color_3.png"),
  Option(4, "Azul", "images/color_4.png"),
];

List<Option> tapiceriaOptions = [
  Option(1, "Deportivo", "images/tapiceria_1.jpg"),
  Option(2, "Cuero", "images/tapiceria_2.png"),
];
