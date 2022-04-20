import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/models/option.dart';

abstract class ActiveConfigurationRepository {
  getTotalPrice();
  CarConfiguration getActiveConfiguration();
  void setConfig (CarConfiguration config);
  String getName ();
  void setName (String name);
  void setModel (Option model);
  void setColor (Option color);
  void setTapiceria (Option tapiceria);
  void setExtra (Option extra);
  bool contains(Option o);
}

class InMemoryActiveConfiguration implements ActiveConfigurationRepository {

  CarConfiguration activeConfig = CarConfiguration.origin("Nueva Configuracion");

  @override
  CarConfiguration getActiveConfiguration() {
    return activeConfig;
  }

  @override
  getTotalPrice() {
    return activeConfig.getTotalPrice();
  }
  
  @override
  void setConfig (CarConfiguration config) {
    activeConfig = config;
  }

  @override
  void setName(String name) {
    activeConfig.setConfigName(name);
  }

  @override
  String getName () {
    return activeConfig.getConfigName();
  }

  @override
  void setModel (Option model) {
    activeConfig.setColor(model);
  }
  @override
  void setColor (Option color) {
    activeConfig.setColor(color);
  }
  @override
  void setTapiceria (Option tapiceria) {
    activeConfig.setColor(tapiceria);
  }
  @override
  void setExtra (Option extra) {
    activeConfig.setColor(extra);
  }
  @override
  bool contains(Option o) {
    return activeConfig.contains(o);
  }

}