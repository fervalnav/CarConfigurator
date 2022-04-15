import 'package:CarConfigurator/backend/CarConfiguration.dart';
import 'package:flutter/material.dart';

/// Clase abstracta que usaremos como interfaz para definir la funcionalidad que debe implementar
/// un repositorio de configuraciones de coches
/// Notar que estamos usando el patron repositorio
abstract class CarConfigurationRepository{

  /// Añadimos una nueva configuracion al repositorio
  void add_new_car_configuration(CarConfiguration new_config);

  /// Buscamos una configuracion en el sistema usando su identificador
  CarConfiguration? find_car_configurationa(UniqueKey id);

  /// Borramos una configuracion del repositorio
  void delete_car_configuration(UniqueKey id);

  /// Modificamos una configuracion en el repositorio
  ///
  /// Notar que no pasamos el identificador de la configuracion que queremos modificar. Esto es
  /// porque CarConfiguration tiene ya dicha identificacion como atributo
  void modify_car_configuration(CarConfiguration new_config);

  /// Devuelve una lista con todas las configuraciones almacenadas en el sistema
  List<CarConfiguration> get_all_configurations();
}

/// Implementamos el repositorio de configuraciones
/// Guardamos y administramos los datos en memoria. No estamos conectandonos a una base de datos
/// ni usando el sistema de ficheros para persistir los datos. Esto se hara mas adelante cuando
/// consumamos una API REST que exponga la persistencia de datos
class InMemoryCarConfigurationRepository implements CarConfigurationRepository{

  /// Lista que usamos como 'base de datos'
  List<CarConfiguration> list_configurations = [];


  /// Añadimos una nueva configuracion al repositorio
  void add_new_car_configuration(CarConfiguration new_config){

    // TODO -- habria que comprobar que no existe ya una configuracion en el sistema con el
    // identificador de esta nueva config

    list_configurations.add(new_config);

  }

  /// Buscamos una configuracion en el sistema usando su identificador
  CarConfiguration? find_car_configurationa(UniqueKey id){

    // Buscamos la configuracion en nuestra lista de configuraciones
    for(CarConfiguration config in this.list_configurations){
      if(config.id == id){
        return config;
      }
    }

    // No hemos encontrado la configuracion buscada
    return null;

  }

  /// Borramos una configuracion del repositorio
  void delete_car_configuration(UniqueKey id){

    // TODO -- hay que implementar esta funcionalidad

  }

  /// Modificamos una configuracion en el repositorio
  ///
  /// Notar que no pasamos el identificador de la configuracion que queremos modificar. Esto es
  /// porque CarConfiguration tiene ya dicha identificacion como atributo
  void modify_car_configuration(CarConfiguration new_config){

    // TODO -- hay que implementar esta funcionalidad

  }


  List<CarConfiguration> get_all_configurations(){
    return this.list_configurations;
  }

}
