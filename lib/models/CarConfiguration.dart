import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/option.dart';

/// Representa la configuracion de compra de un coche realizada
/// TODO -- hay que hacer bien este modelado, pero lo hago asi para poder pintar cosas con mas o menos sentido
class CarConfiguration {

  /// Identificador de la configuracion
  /// Usamos la clase de flutter que nos proporciona llaves unicas
  UniqueKey id = UniqueKey();

  /// Nombre que le queremos dar a la configuracion
  String configName = "";

  Option model = Option(1, "Model 3", 23000, "images/modelo_1.png");
  Option color = Option(1, "Blanco", 0, "images/color_1.png");
  Option tapiceria = Option(1, "Deportivo", 200, "images/tapiceria_1.jpg");
  List<Option> extras = [];

  CarConfiguration(this.configName, this.model, this.color, this.tapiceria) {
    // Generamos automaticamente el valor del identificador
    // Por tanto, no tenemos que pasarlo como parametro del constructor
    id = UniqueKey();
  }
   CarConfiguration.origin(this.configName) {
    // Generamos automaticamente el valor del identificador
    // Por tanto, no tenemos que pasarlo como parametro del constructor
    id = UniqueKey();
  }

  getTotalPrice() {
    var result = model.getPrice() + color.getPrice() + tapiceria.getPrice();
    if(extras.isNotEmpty) {
      result += extras.map((extra) => extra.getPrice()).reduce((a, b) => a+ b);
    }
    return result;
  }

  setModel(Option model) => this.model = model;
  
  setColor(Option color) => this.color = color;

  setTapiceria(Option tapiceria) => this.tapiceria = tapiceria;

  setExtra(Option extra) {
    if(!extras.contains(extra)) extras.add(extra);
  }
  
  removeExtra(Option extra) => extras.remove(extra);
}

enum OptionType { model, color, tapiceria, extra}
