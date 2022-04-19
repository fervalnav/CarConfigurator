import 'package:CarConfigurator/models/carConfiguration.dart';
import 'package:CarConfigurator/components/simple_card.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:flutter/material.dart';

/// Clase que representa visualmente la lista de configuraciones que tenemos almacenadas en el sistema
class CarConfigurationList extends StatelessWidget {
  /// Constructor compacto de esta clase
  /// Si hace falta desarrollar uno mas complejo, podemos usar la sintaxis clasica para especificar
  /// los constructores
  const CarConfigurationList({Key? key}) : super(key: key);

  /// Especificamos como se muestra el widget
  @override
  Widget build(BuildContext context) {
    // Lista de widgets que vamos a construir y mostrar en una columna
    List<Widget> widgetList = [];

    // Lista de configuraciones con las que construimos los widgets
    // Tomamos dicha listas del repositorio de configuraciones
    List<CarConfiguration> configList = DataController().getCarConfigRepo().getAllConfigurations();
    // Iteramos sobre las configuraciones generando los widgets

    // Iteramos sobre las configuraciones generando los widgets
    for (CarConfiguration config in configList) {
      // Usamos una card personalizada para mostrar la informacion de esta configuracion
      widgetList.add(createSimpleCard(
          config.configName,
          "El precio de esta configuracion es ${config.getTotalPrice()}",
          "Configurar",
          "Eliminar"));
    }

    // Devolvemos todo en una columna
    return Column(children: widgetList);
  }
}
