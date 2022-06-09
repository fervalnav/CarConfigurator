
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:CarConfigurator/models/option.dart';

class Tapiceria extends Option {

  static const  String _baseAddress = 'clados.ugr.es';

  static const  String _applicationName = '/DS1_3';

  Tapiceria({required id, required nombre, required precio}) : super(id, nombre, precio);

  Tapiceria.fromJson(Map<String, dynamic> json): super.fromJson(json);

  // @override
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'nombre': nombre,
  //   'precio': precio
  // };

  //////////// get //////////////////
  static Future<List<Tapiceria>> getTapicerias() async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/tapiceria.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get Tapiceria');
    }
  }

  ////////////// create ///////////////
  static Future<Tapiceria> createTapiceria({required String nombre, required double precio}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/tapiceria/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre,
        'precio': precio
      }),
    );
    if (response.statusCode == 201) {
      return Tapiceria.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Tapiceria');
    }

  }

//////////// delete //////////////////
  static Future<Tapiceria> deleteTapiceria(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/tapiceria/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Tapiceria(id:-1, nombre: "", precio: -1);
    } else {
      throw Exception('Failed to delete Tapiceria.');
    }
  }


  /////////// update /////////
  static Future<Tapiceria> updateTapiceria({String? nombre, double? precio, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/tapiceria/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre!,
        'precio': precio!,
      }),
    );
    if (response.statusCode == 200) {
      return Tapiceria.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Tapiceria');
    }
  }
}

