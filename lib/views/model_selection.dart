import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelList extends StatelessWidget{
    @override
  Widget build (BuildContext context){
        return Expanded(
          flex: 1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _list.length,
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0
            ),
            // el index sirve para recorrer una lista de imagenes y acceder a ellas
            itemBuilder: (BuildContext contextm, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 13.0
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      // Estamos construyendo las cajas que contienen los iconos
                      padding: const EdgeInsets.all(10.0),
                      height: 80.0,
                      width: 100.0,
                      child: Image.asset('images/modelo_${index + 1}.png'),
                      decoration: BoxDecoration(
                        color: _list[index].color,
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: _list[index].boxShadow,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Dibujar nombre de cada modelo
                    Text(_list[index].text, style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                );
            },
        ),
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
    text: 'Model 3'
  ),
  ModelStyle(
      id: 2,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model Y'
  ),
  ModelStyle(
      id: 3,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model S'
  ),
  ModelStyle(
      id: 4,
      color: Colors.white, // para resaltar el elemento seleccionado,
      boxShadow: [],
      text: 'Model X'
  ),
];

class ModelStyle{
  final int id;
  final Color color;
  final List<BoxShadow> boxShadow;
  final String text;

  // van dentro de llaves para que sean propiedades opcionales
  ModelStyle({required this.id, required this.color, required this.boxShadow, required this.text});
}
