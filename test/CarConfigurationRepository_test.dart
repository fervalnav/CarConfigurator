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

  });
}
