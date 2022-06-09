
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:CarConfigurator/models/option.dart';

class Color extends Option {

  static const  String _baseAddress = 'clados.ugr.es';

  static const  String _applicationName = 'DS1_3';

  Color({required id, required nombre, required precio}) : super(id, nombre, precio);

  Color.fromJson(Map<String, dynamic> json): super.fromJson(json);

  // @override
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'nombre': nombre,
  //   'precio': precio
  // };

  //////////// get //////////////////
  static Future<List<Color>> getColors() async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/colors.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get Color');
    }
  }

  ////////////// create ///////////////
  static Future<Color> createColor({required String nombre, required double precio}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/colors/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre,
        'precio': precio
      }),
    );
    if (response.statusCode == 201) {
      return Color.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Color');
    }

  }

//////////// delete //////////////////
  static Future<Color> deleteColor(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/colors/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Color(id:-1, nombre: "", precio: -1);
    } else {
      throw Exception('Failed to delete Color.');
    }
  }


  /////////// update /////////
  static Future<Color> updateColor({String? nombre, double? precio, required String id}) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/colors/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': nombre!,
        'precio': precio!,
      }),
    );
    if (response.statusCode == 200) {
      return Color.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Color');
    }
  }
}

