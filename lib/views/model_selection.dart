import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelList extends StatefulWidget {
  final String title;
  //final List<ModelStyle> options;
  const ModelList({Key? key, required this.title}) : super(key: key);

  @override
  State<ModelList> createState() => _ModelListState();
}

class _ModelListState extends State<ModelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    // Estamos construyendo las cajas que contienen los iconos
                    padding: EdgeInsets.zero,
                    height: 185.0,
                    width: 300.0,
                    child: Image.asset('images/modelo_${index + 1}.png'),
                    decoration: BoxDecoration(
                      color: _list[index].color,
                      borderRadius: BorderRadius.circular(19.0),
                      boxShadow: _list[index].boxShadow,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // Dibujar nombre de cada modelo
                  Text(
                    _list[index].text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

List<ModelStyle> _list = [
  ModelStyle(
      id: 1,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [
        BoxShadow(
          color: CupertinoColors.darkBackgroundGray.withOpacity(0.7),
          blurRadius: 10.0,
          spreadRadius: 9.0,
          offset: const Offset(3.0, 5.0),
        ),
      ],
      text: 'Model 3'),
  ModelStyle(
      id: 2,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model Y'),
  ModelStyle(
      id: 3,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model S'),
  ModelStyle(
      id: 4,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model X'),
];

class ModelStyle {
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;

  // van dentro de llaves para que sean propiedades opcionales
  ModelStyle(
      {required this.id,
      required this.color,
      required this.boxShadow,
      required this.text});
}
