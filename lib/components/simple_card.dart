import 'package:flutter/material.dart';

/// Funcion para crear una card simple, con un titulo, texto, imagen y dos botones con texto
/// A partir del codigo, que modificamos:
///     - https://andygeek.com/posts/Fundamentos%20de%20Flutter/posts/Creando-cards-en-flutter/
Card create_simple_card(
    String title,
    String card_text,
    String first_button_text,
    String second_button_text,
    [
        VoidCallback? first_button_callback,
        VoidCallback? second_button_callback,

    ]
){

    // Devolvemos la card creada con los parametros pasados
    return Card(

        // Con esta propiedad modificamos la forma de nuestro card
        // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        // Con esta propiedad agregamos margen a nuestro Card
        // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
        margin: EdgeInsets.all(15),

        // Con esta propiedad agregamos elevación a nuestro card
        // La sombra que tiene el Card aumentará
        elevation: 10,

        // La propiedad child anida un widget en su interior
        // Usamos columna para ordenar un ListTile y una fila con botones
        child: Column(
            children: <Widget>[

            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),

                title: Text(title),
                subtitle: Text(card_text),
                leading: Icon(Icons.home),
                ),

            // Usamos una fila para ordenar los botones del card
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    // Hago ?? () => {} para asignar una funcion que no hace nada si no se
                    // pasa la funcion por parametro (null value)
                    FlatButton(onPressed: first_button_callback ?? () => {}, child: Text(first_button_text)),
                    FlatButton(onPressed: second_button_callback ?? () => {} , child: Text(second_button_text))
                ],
               )
            ],
            ),
        );

}
