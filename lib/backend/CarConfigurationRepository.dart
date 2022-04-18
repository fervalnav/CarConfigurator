import 'package:CarConfigurator/backend/CarConfiguration.dart';
import 'package:flutter/material.dart';

/// Clase abstracta que usaremos como interfaz para definir la funcionalidad que debe implementar
/// un repositorio de configuraciones de coches
/// Notar que estamos usando el patron repositorio
abstract class CarConfigurationRepository{

  /// Añadimos una nueva configuracion al repositorio
  void addNewCarConfiguration(CarConfiguration newConfig);

  /// Buscamos una configuracion en el sistema usando su identificador
  CarConfiguration? findCarConfiguration(UniqueKey id);

  /// Borramos una configuracion del repositorio
  void deleteCarConfiguration(UniqueKey id);

  /// Modificamos una configuracion en el repositorio
  ///
  /// Notar que no pasamos el identificador de la configuracion que queremos modificar. Esto es
  /// porque CarConfiguration tiene ya dicha identificacion como atributo
  void modifyCarConfigurations(CarConfiguration newConfig);

  /// Devuelve una lista con todas las configuraciones almacenadas en el sistema
  List<CarConfiguration> getAllConfigurations();
}

/// Implementamos el repositorio de configuraciones
/// Guardamos y administramos los datos en memoria. No estamos conectandonos a una base de datos
/// ni usando el sistema de ficheros para persistir los datos. Esto se hara mas adelante cuando
/// consumamos una API REST que exponga la persistencia de datos
class InMemoryCarConfigurationRepository implements CarConfigurationRepository{

  /// Lista que usamos como 'base de datos'
  List<CarConfiguration> listConfigurations = [];


  /// Añadimos una nueva configuracion al repositorio
  @override
  void addNewCarConfiguration(CarConfiguration newConfig){

    // TODO -- habria que comprobar que no existe ya una configuracion en el sistema con el
    // identificador de esta nueva config

    listConfigurations.add(newConfig);

  }

  /// Buscamos una configuracion en el sistema usando su identificador
  @override
  CarConfiguration? findCarConfiguration(UniqueKey id){

    // Buscamos la configuracion en nuestra lista de configuraciones
    for(CarConfiguration config in listConfigurations){
      if(config.id == id){
        return config;
      }
    }

    // No hemos encontrado la configuracion buscada
    return null;

  }

  /// Borramos una configuracion del repositorio
  @override
  void deleteCarConfiguration(UniqueKey id){

    // TODO -- hay que implementar esta funcionalidad

  }

  /// Modificamos una configuracion en el repositorio
  ///
  /// Notar que no pasamos el identificador de la configuracion que queremos modificar. Esto es
  /// porque CarConfiguration tiene ya dicha identificacion como atributo
  @override
  void modifyCarConfigurations(CarConfiguration newConfig){

    // TODO -- hay que implementar esta funcionalidad

  }

  @override
  List<CarConfiguration> getAllConfigurations(){
    return listConfigurations;
  }

}
