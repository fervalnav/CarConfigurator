import 'package:CarConfigurator/backend/CarConfiguration.dart';
import 'package:CarConfigurator/backend/CarConfigurationRepository.dart';

/// Clase que toma el control de toda la persistencia de datos
/// Es un singleton que da acceso a los distintos repositorios del sistema
/// Sigo la implementacion dada como ejemplo en la documentacion oficial:
///   - https://flutterbyexample.com/lesson/singletons
class DataController{

  // Instancia que usamos como unico objeto de la clase creado
  static final DataController _instance = DataController._internal();

  CarConfigurationRepository car_config_repo = InMemoryCarConfigurationRepository();

  /// Constructor real de la unica instancia de esta clase
  /// Es privado, asi que no se puede llamar desde fuera de la clase
  /// Ademas, solo se llama una vez, cuando creamos el static __instance
  DataController._internal() {

    // Inicializamos el repositorio de configuraciones con algunas configuraciones iniciales
    // Para que cuando abramos la app haya algunas configuraciones de ejemplo
    car_config_repo = InMemoryCarConfigurationRepository();
    car_config_repo.add_new_car_configuration(
      CarConfiguration("Configuracion de pruebas", 200.5)
    );
    car_config_repo.add_new_car_configuration(
      CarConfiguration("Configuracion de pruebas segunda", 100.3141592)
    );

  }

  /// Constructor de la clase que devuelve la instancia unica
  /// Usamos factory para indicar que devolvemos un objeto de esta clase, pero no necesariamente
  /// creamos una nueva instancia
  factory DataController(){
    return _instance;
  }

  /// Metodo para obtener el repositorio de configuraciones de coches
  CarConfigurationRepository get_car_config_repo(){
    return this.car_config_repo;
  }

}

