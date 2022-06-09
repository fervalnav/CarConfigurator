
import 'package:flutter/material.dart';

class Option {

  int id;
  String nombre;
  double precio;
  // AssetImage imagen;

  // static const  String _baseAddress = 'clados.ugr.es';
  //
  // static const  String _applicationName = 'DS1_3';

  Option(this.id, this.nombre, this.precio);

  @override
  String toString() {
    return "id: $id, nombre: '$nombre', precio: $precio";
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'precio': precio,
    // 'image' : imagen
  };

  Option.fromJson(Map<String, dynamic> json):
        id = json['id'],
        nombre =json['nombre'],
        precio = json['precio'];
        // imagen = json['imagen'];

  // static String get baseAddress => _baseAddress;
  //
  // static String get applicationName => _applicationName;
}

enum OptionType { model, color, tapiceria, extra}