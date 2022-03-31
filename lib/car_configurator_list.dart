import 'package:CarConfigurator/backend/CarConfiguration.dart';
import 'package:CarConfigurator/components/simple_card.dart';
import 'package:flutter/material.dart';

/// Clase que representa visualmente la lista de configuraciones que tenemos almacenadas en el sistema
class CarConfigurationList extends StatefulWidget {
  /// Constructor compacto de esta clase
  /// Si hace falta desarrollar uno mas complejo, podemos usar la sintaxis clasica para especificar
  /// los constructores
  const CarConfigurationList({Key? key}) : super(key: key);

  /// Estado del widget
  @override
  State<StatefulWidget> createState() => _CarConfigurationListState();
}

/// Representacion del estado de la clase CarConfigurationList y tambien especifica como se muestra
/// este Widget
class _CarConfigurationListState extends State<CarConfigurationList> {
  List<CarConfiguration> list_configurations = [
    CarConfiguration("Configuracion de pruebas", 200.5),
    CarConfiguration("Configuracion de pruebas segunda", 100.3141592),
  ];

  void addConfiguration(CarConfiguration new_config) {
    setState(() {
      list_configurations.add(new_config);
    });
  }

  /// Especificamos como se muestra el widget
  @override
  Widget build(BuildContext context) {
    List<Widget> widget_list = [];
    for (CarConfiguration config in this.list_configurations) {
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
