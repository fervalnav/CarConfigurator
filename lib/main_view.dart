// Fichero en el que desarrollamos el codigo para mostrar la vista de la pagina principal de la app
// Esta es la vista que se muestra nada mas abrimos la app
//
// Se muestran cards con las configuraciones que hemos guardado pero que no hemos comprado y un boton
// para comenzar el proceso de crear una nueva configuracion

import 'package:flutter/material.dart';
import 'components/simple_card.dart';
import 'components/simple_box.dart';
import 'car_configurator_list.dart';

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Configuraciones guardadas:",
              style: Theme.of(context).textTheme.headline4,
            ),
            create_simple_card(
              "Titulo de pruebas",
              "Hola esto es un texto largo de pruebas y no se lo que poner",
              "Aceptar",
              "Cancelar",
            ),
            Row(children: <Widget>[
              create_simple_box("images/pruebas.jpg", "Primera", 150, 150),
              create_simple_box("images/pruebas.jpg", "Segunda", 150, 150),
            ]),

            CarConfigurationList(),
          ],
        ),
      ),

      // TODO -- esto tiene que llevar a la vista para realizar la configuracion
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Crear nueva configuracion',
        child: const Icon(Icons.add),
      ),
    );
  }
}
