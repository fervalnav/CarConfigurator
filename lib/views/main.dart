// Fichero en el que desarrollamos el codigo para mostrar la vista de la pagina principal de la app
// Esta es la vista que se muestra nada mas abrimos la app
//
// Se muestran cards con las configuraciones que hemos guardado pero que no hemos comprado y un boton
// para comenzar el proceso de crear una nueva configuracion

import 'package:flutter/material.dart';
import 'package:CarConfigurator/car_configurator_list.dart';

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
/// TODO -- creo que lo podemos pasar a StateLess porque de momento la vista no tiene estado como tal,
/// lo tienen los elementos dentro de la vista
class _HomePageState extends State<HomePage> {
  /// Metodo que define la vista que representa esta pagina
  /// Se ejecuta cada vez que llamamos a setState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title: Text("${widget.title}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // De momento, en la vista lo unico que tenemos es la barra vertical y la lista
            // de configuraciones de coches
            CarConfigurationList(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/nueva_compra")},
        tooltip: 'Crear nueva configuracion',
        child: const Icon(Icons.add),
      ),
    );
  }
}
