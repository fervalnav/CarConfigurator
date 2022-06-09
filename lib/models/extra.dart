
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:CarConfigurator/models/option.dart';

class Extra extends Option {

  static const  String _baseAddress = 'clados.ugr.es';

  static const  String _applicationName = '/DS1_3';

  Extra({required id, required nombre, required precio}) : super(id, nombre, precio);

  Extra.fromJson(Map<String, dynamic> json): super.fromJson(json);

  // @override
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'nombre': nombre,
  //   'precio': precio
  // };

  //////////// get //////////////////
  static Future<List<Extra>> getExtras() async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/extras.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get Extra');
    }
  }

  ////////////// create ///////////////
  static Future<Extra> createExtra({required String nombre, required double precio}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/extras/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre,
        'precio': precio
      }),
    );
    if (response.statusCode == 201) {
      return Extra.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Extra');
    }

  }

//////////// delete //////////////////
  static Future<Extra> deleteExtra(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/extras/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Extra(id:-1, nombre: "", precio: -1);
    } else {
      throw Exception('Failed to delete Extra.');
    }
  }


  /////////// update /////////
  static Future<Extra> updateExtra({String? nombre, double? precio, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/extras/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre!,
        'precio': precio!,
      }),
    );
    if (response.statusCode == 200) {
      return Extra.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Extra');
    }
  }
}

