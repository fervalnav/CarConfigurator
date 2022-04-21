import 'package:flutter/material.dart';

/// Funcion para crear una card simple, con un titulo, texto, imagen y dos botones con texto
/// A partir del codigo, que modificamos:
///     - https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
Card createSimpleCard(
  String title,
  String cardText,
  String firstButtonText,
  String secondButtonText, [
  VoidCallback? firstButtonCallback,
  VoidCallback? secondButtonCallback,
]) {
  // Devolvemos la card creada con los parametros pasados
  return Card(
    // Con esta propiedad modificamos la forma de nuestro card
    // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

    // Con esta propiedad agregamos margen a nuestro Card
    // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    margin: const EdgeInsets.all(15),

    // Con esta propiedad agregamos elevación a nuestro card
    // La sombra que tiene el Card aumentará
    elevation: 10,

    // La propiedad child anida un widget en su interior
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[
        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(title),
          subtitle: Text(cardText),
          leading: const Icon(Icons.car_repair),
        ),

        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Hago ?? () => {} para asignar una funcion que no hace nada si no se
            // pasa la funcion por parametro (null value)
            TextButton(
                onPressed: firstButtonCallback ?? () => {},
                child: Text(firstButtonText)),
            TextButton(
                onPressed: secondButtonCallback ?? () => {},
                child: Text(secondButtonText))
          ],
        )
      ],
    ),
  );
}
