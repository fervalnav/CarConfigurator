import 'package:CarConfigurator/backend/CarConfiguration.dart';
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
    List<Widget> widget_list = [];

    // Lista de configuraciones con las que construimos los widgets
    // Tomamos dicha listas del repositorio de configuraciones
    List<CarConfiguration> config_list = DataController().get_car_config_repo().get_all_configurations();
    // Iteramos sobre las configuraciones generando los widgets

    // Iteramos sobre las configuraciones generando los widgets
    for (CarConfiguration config in config_list) {
      // Usamos una card personalizada para mostrar la informacion de esta configuracion
      widget_list.add(create_simple_card(
          config.config_name,
          "El precio de esta configuracion es ${config.cost}",
          "Configurar",
          "Eliminar"));
    }

    // Devolvemos todo en una columna
    return Column(children: widget_list);
  }
}
