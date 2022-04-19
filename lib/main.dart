import 'package:CarConfigurator/models/carConfiguration.dart';
import 'package:flutter/material.dart';
import 'views/main.dart';
import 'views/buy.dart';
import 'views/model_selection.dart';
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
          brightness: Brightness.dark,
          primaryColor: Colors.lightGreen,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 25.0),
            bodyText2: TextStyle(fontSize: 20.0),
          )),

      // Especificamos las rutas para la navegacion en la app
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: "Home"),
        "/nueva_compra": (context) => BuyPage(
            title: "Compra",
            carConfiguration: CarConfiguration.origin("Nueva Configuracion")),
        "/seleccion_modelo": (context) => ModelList(title: "Modelo")
      },
    );
  }
}

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
