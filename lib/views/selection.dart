import 'package:CarConfigurator/backend/ActiveConfiguration.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:flutter/cupertino.dart';

class Selection extends StatelessWidget {

  final String title;
  final List<Option> options;
  final OptionType type;

  const Selection({Key? key, required this.title, required this.options, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ActiveConfigurationRepository config = DataController().getActiveConfiguration();

    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final item = options[index];
          return InkWell(
              onTap: () {
                // Guardar item en configuracion activa y redirigir a la pestañas de seleccion
                switch (type) {
                  case OptionType.model:
                    config.setModel(options[index]);
                    break;
                  case OptionType.color:
                    config.setColor(options[index]);
                    break;
                  case OptionType.tapiceria:
                    config.setTapiceria(options[index]);
                    break;
                  case OptionType.extra:
                    config.setExtra(options[index]);
                    break;
                }
                Navigator.pop(context, false);
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      // Estamos construyendo las cajas que contienen los iconos
                      padding: EdgeInsets.zero,
                      height: 185.0,
                      width: 300.0,
                      child: Image.asset(item.link),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19.0),
                          boxShadow: (!config.contains(item))
                              ? []
                              : [
                                  BoxShadow(
                                      color: CupertinoColors.darkBackgroundGray
                                          .withOpacity(0.7),
                                      blurRadius: 10.0,
                                      spreadRadius: 9.0,
                                      offset: const Offset(3.0, 5.0))
                                ]),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Dibujar nombre de cada modelo
                    Text(
                      item.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
