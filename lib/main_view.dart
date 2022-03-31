// Fichero en el que desarrollamos el codigo para mostrar la vista de la pagina principal de la app
// Esta es la vista que se muestra nada mas abrimos la app
//
// Se muestran cards con las configuraciones que hemos guardado pero que no hemos comprado y un boton
// para comenzar el proceso de crear una nueva configuracion

import 'package:flutter/material.dart';
import 'components/simple_card.dart';

/// Widget que representa la pagina home de la aplicacion
/// Es stateful (definimos en el estado en una clase mas abajo)
class HomePage extends StatefulWidget {

    const HomePage({Key? key, required this.title}) : super(key: key);

    /// Titulo de la app que vamos a mostrar en la barra superior
    final String title;

    /// Creacion del estado de la vista
    @override
    State<HomePage> createState() => _HomePageState();
}

/// Esta clase representa el estado del widget HomePage
/// Controla el metodo build() que indica como queremos mostrar la vista
class _HomePageState extends State<HomePage> {

    int _counter = 0;

    void _incrementCounter() {
        // Con esta llamada a setState le indicamos a Flutter que hemos cambiado el estado, y por
        // tanto debemos cambiar la vista (provocando una llamada a build())
        // Si cambiamos el valor de _counter sin setState() no se actualizaria la vista
        setState(() {
            _counter++;
        });
    }

    /// Metodo que define la vista que representa esta pagina
    /// Se ejecuta cada vez que llamamos a setState
    @override
        Widget build(BuildContext context) {

            return Scaffold(

                // Barra horizontal en la parte superior de la app
                appBar: AppBar(
                    // Here we take the value from the HomePage object that was created by
                    // the App.build method, and use it to set our appbar title.
                    title: Text(widget.title),
                ),
                body: Center(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    child: Column(
                        // Column is also a layout widget. It takes a list of children and
                        // arranges them vertically. By default, it sizes itself to fit its
                        // children horizontally, and tries to be as tall as its parent.
                        //
                        // Invoke "debug painting" (press "p" in the console, choose the
                        // "Toggle Debug Paint" action from the Flutter Inspector in Android
                        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                        // to see the wireframe for each widget.
                        //
                        // Column has various properties to control how it sizes itself and
                        // how it positions its children. Here we use mainAxisAlignment to
                        // center the children vertically; the main axis here is the vertical
                        // axis because Columns are vertical (the cross axis would be
                        // horizontal).
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        const Text(
                            'You have pushed the button this many times:',
                            ),
                        Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headline4,
                        ),

                        create_simple_card(
                            "Titulo de pruebas",
                            "Hola esto es un texto largo de pruebas y no se lo que poner",
                            "Aceptar",
                            "Cancelar",
                        ),


                        ],
                    ),
                ),

                floatingActionButton: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                ),
            );
        }
}

