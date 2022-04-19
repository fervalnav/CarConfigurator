import 'package:CarConfigurator/main.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/views/selection.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/components/simple_box.dart';
import 'main.dart';

/// Vista de compra/configuracion de un nuevo coche
class BuyPage extends StatefulWidget {
  final String title;
  CarConfiguration carConfiguration;

  BuyPage({Key? key, required this.title, required this.carConfiguration}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    // Tamaño de las cajas que van a componer esta vista
    var size = 175.0;
    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title: Text("${widget.title}: ${widget.carConfiguration.getTotalPrice()}"),
      ),
      body: Center(

        // Añado un padding para que haya espacio con la barra superior de la aplicacion
        child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(

              // Para que la columna este "pegada" a la parte superior de la pantalla
              // Realmente, estamos pegados a la parte superior del padding que hemos añadido
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Row(
                  // Para que las dos imagenes de esta fila esten centradas
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    createSimpleBox(
                        "images/pruebas.jpg",
                        "Modelo",
                        size, size,

                        // Vamos a la vista de seleccion de modelo
                          () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Selection(title: 'Modelo', options: modelOptions, carConfiguration: widget.carConfiguration, type: OptionType.model))
                        )},
                    ),
                    createSimpleBox(
                        "images/paleta_colores.jpg",
                        "Color",
                        size, size,
                        () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Selection(title: 'Color', options: colorOptions, carConfiguration: widget.carConfiguration, type: OptionType.color))
                        )},
                        ),
                  ],
                ),
                Row(
                  // Para que las dos imagenes de esta fila esten centradas
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    createSimpleBox(
                        "images/tapiceria.jpg",
                        "Tapicería",
                        size, size,
                        () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Selection(title: 'Tapiceria', options: tapiceriaOptions, carConfiguration: widget.carConfiguration, type: OptionType.tapiceria))
                        )},
                        ),
                    createSimpleBox(
                        "images/extras.jpg",
                        "Extras",
                        size, size,
                        () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Selection(title: 'Extras', options: extrasOptions, carConfiguration: widget.carConfiguration, type: OptionType.extra))
                        )},),
                  ],
                ),
              ],
            )),
      ),

      // Boton para guardar la configuracion
      // TODO -- hay que implementar el mecanismo de salvado de esta configuracion
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataController()
            .getCarConfigRepo()
            .modifyCarConfigurations(
                widget.carConfiguration
            );
          Navigator.pushNamed(context, "/");
        },
        tooltip: 'Guardar configuracion',
        child: const Icon(Icons.save),
      ),

    );
  }
}
