/// Representa la configuracion de compra de un coche realizada
/// TODO -- hay que hacer bien este modelado, pero lo hago asi para poder pintar cosas con mas o menos sentido
class CarConfiguration {

  /// Nombre que le queremos dar a la configuracion
  String config_name = "";

  /// Coste total de la configuracion
  double cost = 0.0;

  CarConfiguration(String config_name, double cost) {
    this.config_name = config_name;
    this.cost = cost;
  }
}
