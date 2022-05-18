import 'package:flutter/material.dart';

/// Funcion que crea una caja simple, clickable, con un texto en el inferior de la caja
/// [imageAsset] especifica la imagen que vamos a usar
/// [underImageText] especifica el texto (si queremos) que aparece debajo de la imagen
/// [callback] define la funcion que se ejecuta cuando clickamos en la caja
/// [height] y [width] especifican el tamaño de la caja
Card createSimpleBox(String imageAsset, String underImageText, [double? height, double? width, VoidCallback? callback]) {

  return Card(
      child: Column(children: <Widget>[
        GestureDetector(
          child: Container(
            height: height ?? 120.0,
            width: width ?? 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          onTap: callback ?? () => {},
        ),
        Text(underImageText),
      ]));
}
