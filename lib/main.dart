import 'package:flutter/material.dart';
import 'views/LoadingScreen.dart';
import 'views/main.dart';
import 'views/buy.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Car Configurator",
        debugShowCheckedModeBanner: false,
        home: LoadingScreen());
  }
}

// ------------------------------------------------------------------

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

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
        "/nueva_compra": (context) => BuyPage(title: "Configuración", configId: null),
      },
    );
  }
}
