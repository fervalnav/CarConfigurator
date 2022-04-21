import 'package:CarConfigurator/backend/CarConfigurationRepository.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:flutter_test/flutter_test.dart';

// TODO -- tomo esto de main.dart. Deberia ir en una clase separada
List<Option> modelOptions = [
  Option(1, "Model 3", 23000, "images/modelo_1.png"),
  Option(2, "Model Y", 25000, "images/modelo_2.png"),
  Option(3, "Model S", 40000, "images/modelo_3.png"),
  Option(4, "Model X", 30000, "images/modelo_4.png"),
];

List<Option> colorOptions = [
  Option(1, "Blanco", 0, "images/color_1.png"),
  Option(2, "Negro", 10, "images/color_2.png"),
  Option(3, "Rojo", 20, "images/color_3.png"),
  Option(4, "Azul", 20, "images/color_4.png"),
];

List<Option> tapiceriaOptions = [
  Option(1, "Deportivo", 200, "images/tapiceria_1.jpg"),
  Option(2, "Cuero", 100, "images/tapiceria_2.png"),
];

List<Option> extrasOptions = [
  Option(1, "Altavoces", 200, "images/extras_1.jpg"),
  Option(2, "Pantalla", 500, "images/extras_2.jpg"),
];

/// Funcion que usamos para instanciar un repositorio de configuraciones
/// De esta forma, no tenemos que repetir este codigo de inicializacion una y otra vez
InMemoryCarConfigurationRepository create_basic_repo(){
  InMemoryCarConfigurationRepository repo = InMemoryCarConfigurationRepository();

  CarConfiguration first = CarConfiguration("Primera configuracion", modelOptions[0], colorOptions[0], tapiceriaOptions[0]);
  repo.addNewCarConfiguration(first);

  CarConfiguration second = CarConfiguration("Segunda configuracion", modelOptions[1], colorOptions[1], tapiceriaOptions[1]);
  repo.addNewCarConfiguration(second);

  CarConfiguration third = CarConfiguration("Tercera configuracion", modelOptions[2], colorOptions[2], tapiceriaOptions[1]);
  repo.addNewCarConfiguration(third);

  return repo;
}

/// Funcion principal que usamos para lanzar todos los tests unitarios
void main() {

  /// Grupo de tests unitarios para la clase InMemoryCarConfigurationRepository
  /// No testeamos CarConfigurationRepository porque es una interfaz, no tiene implementaciones que
  /// validar
  group('CarConfigurationRepository', () {
    // test('value should start at 0', () {
    //   expect(Counter().value, 0);
    // });

    test("Los valores se almacenan correctamente", (){
      InMemoryCarConfigurationRepository repo = create_basic_repo();
      expect(repo.getAllConfigurations().length, 3);
    });

    test("La funcionalidad de añadir funciona como se espera", (){
      InMemoryCarConfigurationRepository repo = create_basic_repo();

      // Añado una nueva config, asi que deberiamos tener 4 configuraciones almacenadas
      CarConfiguration new_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      repo.addNewCarConfiguration(new_conf);
      expect(repo.getAllConfigurations().length, 4);

      // Añado una nueva config, asi que deberiamos tener 5 configuraciones almacenadas
      // Al estar creando una configuracion con los mismos datos, pero UniqueKey distinta (de lo que
      // se encarga la clase CarConfiguration), deberiamos añadir un nuevo elemento
      CarConfiguration other_new_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      repo.addNewCarConfiguration(other_new_conf);
      expect(repo.getAllConfigurations().length, 5);

      // Pero ahora si usamos el mismo objeto, la nueva configuracion no se debe añadir
      repo.addNewCarConfiguration(other_new_conf);
      expect(repo.getAllConfigurations().length, 5);
    });

    test("La funcionalidad de buscar configuraciones funciona como se espera", (){
      InMemoryCarConfigurationRepository repo = create_basic_repo();

      // Añado una nueva config y la busco
      CarConfiguration new_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      repo.addNewCarConfiguration(new_conf);

      CarConfiguration? found_config = repo.findCarConfiguration(new_conf.id);
      expect(found_config, new_conf);

      // Si creo una configuracion con los mismos valores, el id deberia ser diferente, y por tanto
      // al buscar no deberiamos encontrar nada
      CarConfiguration other_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      CarConfiguration? other_found_config = repo.findCarConfiguration(other_conf.id);
      expect(other_found_config, null);
    });

    test("La funcionalidad de eliminar configuraciones funciona como se espera", (){
      InMemoryCarConfigurationRepository repo = create_basic_repo();

      // Añado una nueva config que luego voy a borrar
      CarConfiguration new_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      repo.addNewCarConfiguration(new_conf);
      expect(repo.getAllConfigurations().length, 4);

      // Borramos la configuracion e intentamos buscarla en el repositorio
      repo.deleteCarConfiguration(new_conf.id);
      expect(repo.getAllConfigurations().length, 3);
      expect(repo.findCarConfiguration(new_conf.id), null);
    });

    test("Borrar dos veces la misma configuracion solo borra en la primera vez", (){
      InMemoryCarConfigurationRepository repo = create_basic_repo();

      // Añado una nueva config que luego voy a borrar
      CarConfiguration new_conf = CarConfiguration("Configuracion nueva", modelOptions[1], colorOptions[3], tapiceriaOptions[0]);
      repo.addNewCarConfiguration(new_conf);
      expect(repo.getAllConfigurations().length, 4);

      // Borramos la configuracion e intentamos buscarla en el repositorio
      repo.deleteCarConfiguration(new_conf.id);
      expect(repo.getAllConfigurations().length, 3);
      expect(repo.findCarConfiguration(new_conf.id), null);


      // Volvemos a borrar, no deberia cambiar el estado del repositorio
      repo.deleteCarConfiguration(new_conf.id);
      expect(repo.getAllConfigurations().length, 3);
      expect(repo.findCarConfiguration(new_conf.id), null);
    });




  });
}
