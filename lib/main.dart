import 'package:flutter/material.dart';
import 'main_view.dart';
import 'buy_view.dart';

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
      },
    );
  }
}
