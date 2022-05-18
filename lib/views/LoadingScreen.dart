import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getToken().then((val) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
    });
    super.initState();
  }

  // Funcion que al llamarla provoca un delay y devuelve un token de seguridad
  Future<String> getToken() async {
    await Future.delayed(const Duration(seconds: 4));
    return "123";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset('assets/LogotipoAnimadoLottie.json')),
    );
  }
}