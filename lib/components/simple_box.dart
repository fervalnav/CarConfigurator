import 'package:flutter/material.dart';

/// Funcion que crea una caja simple, clickable, con un texto en el inferior de la caja
/// [image_asset] especifica la imagen que vamos a usar
/// [under_image_text] especifica el texto (si queremos) que aparece debajo de la imagen
/// [callback] define la funcion que se ejecuta cuando clickamos en la caja
Container create_simple_box(
    String image_asset,
    String under_image_text,
    [VoidCallback? callback]
){

    /* return Image(image: AssetImage('graphics/background.png')); */

    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image_asset),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
}
