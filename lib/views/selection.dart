import 'package:CarConfigurator/models/carConfiguration.dart';
import 'package:CarConfigurator/views/buy.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:flutter/cupertino.dart';

class Selection extends StatefulWidget {
  final String title;
  final List<Option> options;
  CarConfiguration carConfiguration;
  final OptionType type;
  Selection({Key? key,  required this.title, required this.options, required this.carConfiguration, required this.type}): super(key: key);

   @override
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          final item = widget.options[index];
          return InkWell(
            onTap: () {
              // Guardar item en configuracion activa y redirigir a la pestañas de seleccion
              switch(widget.type) {
                case OptionType.model:
                  widget.carConfiguration.setModel(widget.options[index]);
                  break;
                case OptionType.color:
                  widget.carConfiguration.setColor(widget.options[index]);
                  break;
                case OptionType.tapiceria:
                  widget.carConfiguration.setTapiceria(widget.options[index]);
                  break;
                case OptionType.extra:
                  widget.carConfiguration.setExtra(widget.options[index]);
                  break;
              }
              Navigator.push(context, MaterialPageRoute (builder: (context) =>BuyPage(title: widget.carConfiguration.configName, carConfiguration: widget.carConfiguration)));
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
                      boxShadow: (!widget.carConfiguration.contains(item)) ? [] :
                        [
                          BoxShadow(
                            color: CupertinoColors.darkBackgroundGray.withOpacity(0.7),
                            blurRadius: 10.0,
                            spreadRadius: 9.0,
                            offset: const Offset(3.0, 5.0)
                          )
                        ]
                    ),
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
            )
          );
        },
      ),

    );
  }
}