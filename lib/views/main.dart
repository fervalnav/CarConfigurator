// Fichero en el que desarrollamos el codigo para mostrar la vista de la pagina principal de la app
// Esta es la vista que se muestra nada mas abrimos la app
//
// Se muestran cards con las configuraciones que hemos guardado pero que no hemos comprado y un boton
// para comenzar el proceso de crear una nueva configuracion

import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/components/simple_card.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/views/buy.dart';

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
/// lo tienen los elementos dentro de la vista
class _HomePageState extends State<HomePage> {
  List<CarConfiguration> configurations =
      DataController().getCarConfigRepo().getAllConfigurations();
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
          child: ListView.builder(
        itemCount: configurations.length,
        itemBuilder: (context, index) {
          final item = configurations[index];
          return createSimpleCard(
              item.configName,
              "El precio de esta configuracion es ${item.getTotalPrice()}",
              "Configurar",
              "Eliminar",
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyPage(
                                title: 'Configuracion',
                                configId: item.id
                            ))).then((value) => setState(() {}))
                  }, () {
            DataController().getCarConfigRepo().deleteCarConfiguration(item.id);
            setState(() {
              configurations =
                  DataController().getCarConfigRepo().getAllConfigurations();
            });
          });
        },
      )),
      // Boton para crear una nueva compra
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, "/nueva_compra").then((value) => setState(() {}))},
        tooltip: 'Crear nueva configuracion',
        child: const Icon(Icons.add),
      ),
    );
  }
}
