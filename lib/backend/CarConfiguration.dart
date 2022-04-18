import 'package:flutter/material.dart';

/// Representa la configuracion de compra de un coche realizada
/// TODO -- hay que hacer bien este modelado, pero lo hago asi para poder pintar cosas con mas o menos sentido
class CarConfiguration {

  /// Identificador de la configuracion
  /// Usamos la clase de flutter que nos proporciona llaves unicas
  UniqueKey id = UniqueKey();

  /// Nombre que le queremos dar a la configuracion
  String configName = "";

  /// Coste total de la configuracion
  double cost = 0.0;

  CarConfiguration(this.configName, this.cost) {
    // Generamos automaticamente el valor del identificador
    // Por tanto, no tenemos que pasarlo como parametro del constructor
    id = UniqueKey();
  }
}
