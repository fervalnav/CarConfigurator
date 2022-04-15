import 'package:flutter/material.dart';
import 'package:CarConfigurator/components/simple_box.dart';

/// Vista de compra/configuracion de un nuevo coche
class BuyPage extends StatefulWidget {
  final String title;

  const BuyPage({Key? key, required this.title}) : super(key: key);

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
        title: Text("${widget.title}"),
      ),
      body: Center(

        // Añado un padding para que haya espacio con la barra superior de la aplicacion
        child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(

              // Para que la columna este "pegada" a la parte superior de la pantalla
              // Realmente, estamos pegados a la parte superior del padding que hemos añadido
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Row(
                  // Para que las dos imagenes de esta fila esten centradas
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    create_simple_box(
                        "images/pruebas.jpg",
                        "Modelo",
                        size, size,

                        // Vamos a la vista de seleccion de modelo
                        () => {Navigator.pushNamed(context, "/seleccion_modelo")},
                    ),
                    create_simple_box(
                        "images/paleta_colores.jpg", "Color", size, size),
                  ],
                ),
                Row(
                  // Para que las dos imagenes de esta fila esten centradas
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    create_simple_box(
                        "images/tapiceria.jpg", "Tapicería", size, size),
                    create_simple_box(
                        "images/extras.jpg", "Extras", size, size),
                  ],
                ),
              ],
            )),
      ),

      // Boton para guardar la configuracion
      // TODO -- hay que implementar el mecanismo de salvado de esta configuracion
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Guardar configuracion',
        child: const Icon(Icons.save),
      ),

    );
  }
}
