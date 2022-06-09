import 'package:CarConfigurator/backend/ActiveConfiguration.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/models/option.dart';
import 'package:CarConfigurator/models/modelo.dart';
import 'package:CarConfigurator/models/color.dart';
import 'package:CarConfigurator/models/tapiceria.dart';
import 'package:CarConfigurator/models/extra.dart';
import 'package:flutter/cupertino.dart';
import 'package:CarConfigurator/data.dart';

class Selection extends StatefulWidget {

  final String title;
  final OptionType type;

  const Selection({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {

  late Future<Option> options;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    // switch (widget.type) {
    //   case OptionType.model:
    //     options = Modelo.getModelos();
    //     images = modelImages;
    //     break;
    //   case OptionType.color:
    //     options = Color.getColors();
    //     images = colorImages;
    //     break;
    //   case OptionType.tapiceria:
    //     options = Tapiceria.getTapicerias();
    //     images = tapiceriaImages;
    //     break;
    //   case OptionType.extra:
    //     options = Extra.getExtras();
    //     images = extrasImages;
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {

      ActiveConfigurationRepository config = DataController().getActiveConfiguration();

      List<Option> options = [];
      // Future<Option>? options;
      List<String> images = [];
      // setState(() {
        switch (widget.type) {
          case OptionType.model:
            options = modelos;
            images = modelImages;
            break;
          case OptionType.color:
            options = colors;
            images = colorImages;
            break;
          case OptionType.tapiceria:
            options = tapicerias;
            images = tapiceriaImages;
            break;
          case OptionType.extra:
            options = extras;
            images = extrasImages;
            break;
        }
      // });

      return Scaffold(
        // Barra horizontal en la parte superior de la app
        appBar: AppBar(
          // Tomamos el valor de Homepage para usarlo en la barra
          title: Text(widget.title),
        ),
        body:
        // FutureBuilder<Option>(
        //   future: options,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       // return ListView.builder(
        //       //   itemCount: snapshot.data!.length,
        //       //   itemBuilder: (context, index) {
        //       //     final item = snapshot.data![index];
        //       //     return InkWell(
        //       //         onTap: () {
        //       //           // Guardar item en configuracion activa y redirigir a la pestañas de seleccion
        //       //           switch (widget.type) {
        //       //             case OptionType.model:
        //       //               config.setModel(item);
        //       //               break;
        //       //             case OptionType.color:
        //       //               config.setColor(item);
        //       //               break;
        //       //             case OptionType.tapiceria:
        //       //               config.setTapiceria(item);
        //       //               break;
        //       //             case OptionType.extra:
        //       //               config.setExtra(item);
        //       //               break;
        //       //           }
        //       //           Navigator.pop(context, false);
        //       //         },
        //       //         child: Padding(
        //       //           padding:
        //       //           const EdgeInsets.only(left: 10.0, right: 10.0, top: 13.0),
        //       //           child: Column(
        //       //             mainAxisSize: MainAxisSize.max,
        //       //             children: [
        //       //               Container(
        //       //                 // Estamos construyendo las cajas que contienen los iconos
        //       //                 padding: EdgeInsets.zero,
        //       //                 height: 185.0,
        //       //                 width: 300.0,
        //       //                 child: Image.asset(images[index]),
        //       //                 decoration: BoxDecoration(
        //       //                     color: Colors.white,
        //       //                     borderRadius: BorderRadius.circular(19.0),
        //       //                     boxShadow: (!config.contains(item))
        //       //                         ? []
        //       //                         : [
        //       //                       BoxShadow(
        //       //                           color: CupertinoColors.darkBackgroundGray
        //       //                               .withOpacity(0.7),
        //       //                           blurRadius: 10.0,
        //       //                           spreadRadius: 9.0,
        //       //                           offset: const Offset(3.0, 5.0))
        //       //                     ]),
        //       //               ),
        //       //               const SizedBox(
        //       //                 height: 15.0,
        //       //               ),
        //       //               // Dibujar nombre de cada modelo
        //       //               Text(
        //       //                 item.nombre,
        //       //                 style: const TextStyle(
        //       //                   color: Colors.white,
        //       //                   fontSize: 20.0,
        //       //                   fontWeight: FontWeight.w600,
        //       //                 ),
        //       //               ),
        //       //               const SizedBox(
        //       //                 height: 60.0,
        //       //               ),
        //       //             ],
        //       //           ),
        //       //         ));
        //       //   },
        //       // );
        //
        //       return Text(snapshot.data!.toString());
        //     }
        //     else if (snapshot.hasError) {
        //         return Text('${snapshot.error}');
        //     }
        //     return const CircularProgressIndicator();
        //   }
        // ),
        ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            final item = options[index];
            return InkWell(
                onTap: () {
                  // Guardar item en configuracion activa y redirigir a la pestañas de seleccion
                  switch (widget.type) {
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
                        child: Image.asset(images[index]),
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
                        item.nombre,
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