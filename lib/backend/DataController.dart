import 'package:CarConfigurator/backend/ActiveConfiguration.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/backend/CarConfigurationRepository.dart';

/// Clase que toma el control de toda la persistencia de datos
/// Es un singleton que da acceso a los distintos repositorios del sistema
/// Sigo la implementacion dada como ejemplo en la documentacion oficial:
///   - https://flutterbyexample.com/lesson/singletons
class DataController{

  // Instancia que usamos como unico objeto de la clase creado
  static DataController _instance = DataController._internal();

  CarConfigurationRepository carConfigRepo = InMemoryCarConfigurationRepository();
  ActiveConfigurationRepository activeConfig = InMemoryActiveConfiguration();

  /// Constructor real de la unica instancia de esta clase
  /// Es privado, asi que no se puede llamar desde fuera de la clase
  /// Ademas, solo se llama una vez, cuando creamos el static __instance
  DataController._internal() {

    // Inicializamos el repositorio de configuraciones con algunas configuraciones iniciales
    // Para que cuando abramos la app haya algunas configuraciones de ejemplo
    carConfigRepo = InMemoryCarConfigurationRepository();
    carConfigRepo.addNewCarConfiguration(
      CarConfiguration.origin("Configuracion de pruebas 1")
    );
    carConfigRepo.addNewCarConfiguration(
      CarConfiguration.origin("Configuracion de pruebas 2")
    );
    activeConfig = InMemoryActiveConfiguration();

  }

  /// Constructor de la clase que devuelve la instancia unica
  /// Usamos factory para indicar que devolvemos un objeto de esta clase, pero no necesariamente
  /// creamos una nueva instancia
  factory DataController(){
    return _instance;
  }

  /// Metodo para obtener el repositorio de configuraciones de coches
  CarConfigurationRepository getCarConfigRepo(){
    return carConfigRepo;
  }

  ActiveConfigurationRepository getActiveConfiguration() {
    return activeConfig;
  }

  /// Funcion para resetear el repositorio de configuraciones
  /// Unicamente es usada para tests. Es necesaria ya que los tests que haya dentro de un mismo
  /// main utilizan el mismo repositorio de configuraciones, por lo que los cambios realizados
  /// en un test afectarían a los demás si no se resetea el repositorio.
  static void restart() {
    _instance = DataController._internal();
  }

}

