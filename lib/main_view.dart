// Fichero en el que desarrollamos el codigo para mostrar la vista de la pagina principal de la app
// Esta es la vista que se muestra nada mas abrimos la app
//
// Se muestran cards con las configuraciones que hemos guardado pero que no hemos comprado y un boton
// para comenzar el proceso de crear una nueva configuracion

import 'package:flutter/material.dart';

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

                        create_card(
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


/// Funcion para crear una card simple, con un titulo, texto, imagen y dos botones con texto
/// A partir del codigo, que modificamos:
///     - https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
Card create_card(String title, String card_text, String first_button_text, String second_button_text){
    return Card(

        // Con esta propiedad modificamos la forma de nuestro card
        // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        // Con esta propiedad agregamos margen a nuestro Card
        // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
        margin: EdgeInsets.all(15),

        // Con esta propiedad agregamos elevación a nuestro card
        // La sombra que tiene el Card aumentará
        elevation: 10,

        // La propiedad child anida un widget en su interior
        // Usamos columna para ordenar un ListTile y una fila con botones
        child: Column(
            children: <Widget>[

            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),

                title: Text(title),
                subtitle: Text(card_text),
                leading: Icon(Icons.home),
                ),

            // Usamos una fila para ordenar los botones del card
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    FlatButton(onPressed: () => {}, child: Text(first_button_text)),
                    FlatButton(onPressed: () => {}, child: Text(second_button_text))
                ],
               )
            ],
            ),
        );

}
