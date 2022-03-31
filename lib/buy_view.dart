import 'package:flutter/material.dart';


class BuyPage extends StatefulWidget{
  final String title;

  const BuyPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage>{
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
            // TODO -- no tenemos nada en la vista
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
