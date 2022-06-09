
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:CarConfigurator/models/option.dart';

class Modelo extends Option {

  static const  String _baseAddress = 'clados.ugr.es';

  static const  String _applicationName = '/DS1_3';

  Modelo({required id, required nombre, required precio}) : super(id, nombre, precio);

  Modelo.fromJson(Map<String, dynamic> json): super.fromJson(json);

  // @override
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'nombre': nombre,
  //   'precio': precio
  // };

  //////////// get //////////////////
  static Future<Modelo> getModelos() async {

    final response = await http.get(
        // Uri.https(_baseAddress, '$_applicationName/modelos/8'),
        Uri.https(_baseAddress, 'DS1_3/modelos/8.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return Modelo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Modelo');
    }
  }

  ////////////// create ///////////////
  static Future<Modelo> createModelo({required String nombre, required double precio}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/modelos/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre,
        'precio': precio
      }),
    );
    if (response.statusCode == 201) {
      return Modelo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Modelo');
    }

  }

//////////// delete //////////////////
  static Future<Modelo> deleteModelo(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/modelos/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Modelo(id:-1, nombre: "", precio: -1);
    } else {
      throw Exception('Failed to delete Modelo.');
    }
  }


  /////////// update /////////
  static Future<Modelo> updateModelo({String? nombre, double? precio, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/modelos/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre!,
        'precio': precio!,
      }),
    );
    if (response.statusCode == 200) {
      return Modelo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Modelo');
    }
  }
}

