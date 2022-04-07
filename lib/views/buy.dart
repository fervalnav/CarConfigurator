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
            Row(
              children: <Widget>[
                create_simple_box("images/pruebas.jpg", "Modelo"),
                create_simple_box("images/paleta_colores.jpg", "Color"),
              ],
            ),
            Row(
              children: <Widget>[
                create_simple_box("images/tapiceria.jpg", "Tapicería"),
                create_simple_box("images/extras.jpg", "Extras"),
              ],
            ),
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
