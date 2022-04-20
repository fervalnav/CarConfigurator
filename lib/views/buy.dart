import 'package:CarConfigurator/backend/ActiveConfiguration.dart';
import 'package:CarConfigurator/main.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/views/selection.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/components/simple_box.dart';

/// Vista de compra/configuracion de un nuevo coche
class BuyPage extends StatefulWidget {
  final String title;
  final UniqueKey? configId;

  BuyPage({Key? key, required this.title, required this.configId }) : super(key: key) {
    if(configId != null) {
      CarConfiguration? aConfig = DataController().getCarConfigRepo().findCarConfiguration(configId ?? UniqueKey());
      DataController().getActiveConfiguration().setConfig(aConfig ?? CarConfiguration.origin("Nueva Configuracion"));
    } else {
    DataController().getActiveConfiguration().setConfig(CarConfiguration.origin("Nueva Configuracion"));
    }
  }
  @override
  State<StatefulWidget> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    ActiveConfigurationRepository config = DataController().getActiveConfiguration();
    // Tamaño de las cajas que van a componer esta vista
    var size = 175.0;
    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title:
            Text(widget.title),
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
                      () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selection(
                                    title: 'Modelo',
                                    options: modelOptions,
                                    type: OptionType.model)))
                      },
                    ),
                    createSimpleBox(
                      "images/paleta_colores.jpg",
                      "Color",
                      size,
                      size,
                      () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selection(
                                    title: 'Color',
                                    options: colorOptions,
                                    type: OptionType.color)))
                          .then((value) => setState(() {}))
                      },
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
                      size,
                      size,
                      () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selection(
                                    title: 'Tapiceria',
                                    options: tapiceriaOptions,
                                    type: OptionType.tapiceria)))
                          .then((value) => setState(() {}))
                      },
                    ),
                    createSimpleBox(
                      "images/extras.jpg",
                      "Extras",
                      size,
                      size,
                      () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Selection(
                                    title: 'Extras',
                                    options: extrasOptions,
                                    type: OptionType.extra)))
                        .then((value) => setState(() {}))
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),

      // Boton para guardar la configuracion
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataController()
              .getCarConfigRepo()
              .modifyCarConfigurations(config.getActiveConfiguration());
          Navigator.pop(context, false);

          // Se crea una SnackBar cuando se pulsa el botón de guardar. Se le podría añadir una acción como por ejemplo un boton 2deshacer"
          final snackBar = SnackBar(
            content: const Text(
              'Configuración guardada',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );

          // Muestra en el Scaffold la SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Guardar configuracion',
        child: const Icon(Icons.save),
      ),
    );
  }
}
