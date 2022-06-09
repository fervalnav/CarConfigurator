import 'package:CarConfigurator/models/car_configuration.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:CarConfigurator/models/modelo.dart';
import 'package:CarConfigurator/models/color.dart';
import 'package:CarConfigurator/models/tapiceria.dart';
import 'package:CarConfigurator/models/extra.dart';

abstract class ActiveConfigurationRepository {
  getTotalPrice();
  CarConfiguration getActiveConfiguration();
  void setConfig (CarConfiguration config);
  String getName ();
  void setName (String name);
  void setModel (Option model);
  Option getModel();
  void setColor (Option color);
  Option getColor();
  void setTapiceria (Option tapiceria);
  Option getTapiceria();
  void setExtra (Option extra);
  List<Option> getExtras();
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
    activeConfig.setModel(model);
  }

  @override
  Option getModel() {
    return activeConfig.getModel();
  }

  @override
  void setColor (Option color) {
    activeConfig.setColor(color);
  }

  @override
  Option getColor() {
    return activeConfig.getColor();
  }

  @override
  void setTapiceria (Option tapiceria) {
    activeConfig.setTapiceria(tapiceria);
  }

  @override
  Option getTapiceria() {
    return activeConfig.getTapiceria();
  }

  @override
  void setExtra (Option extra) {
    activeConfig.setExtra(extra);
  }

  @override
  List<Option> getExtras() {
    return activeConfig.getExtras();
  }

  @override
  bool contains(Option o) {
    return activeConfig.contains(o);
  }

}