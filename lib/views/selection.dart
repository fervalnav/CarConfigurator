import 'package:CarConfigurator/models/carConfiguration.dart';
import 'package:CarConfigurator/views/buy.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/option.dart';

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
            child: Card(
              child: ListTile(
                title: Text(item.text),
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: Image.asset(item.link, fit: BoxFit.cover),
                ),
              ),
            )
          );
        },
      ),

    );
  }
}