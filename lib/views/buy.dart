import 'package:CarConfigurator/backend/ActiveConfiguration.dart';
import 'package:CarConfigurator/models/CarConfiguration.dart';
import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/views/selection.dart';
import 'package:flutter/material.dart';
import 'package:CarConfigurator/components/simple_box.dart';

import '../Data.dart';

/// Vista de compra/configuracion de un nuevo coche
class BuyPage extends StatefulWidget {

  final String title;
  final UniqueKey? configId;

  BuyPage({Key? key, required this.title, required this.configId }) : super(key: key) {

    if(configId != null) {

      CarConfiguration? aConfig = DataController().getCarConfigRepo().findCarConfiguration(configId ?? UniqueKey());
      DataController().getActiveConfiguration().setConfig(aConfig ?? CarConfiguration.origin("Nueva Configuracion"));
    }
    else {

      DataController().getActiveConfiguration().setConfig(CarConfiguration.origin("Nueva Configuracion"));
    }
  }

  @override
  State<StatefulWidget> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ActiveConfigurationRepository config = DataController().getActiveConfiguration();


  @override
  Widget build(BuildContext context) {

    // Tamaño de las cajas que van a componer esta vista
    var size = MediaQuery.of(context).size.width / 2 * 0.8;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        // Barra horizontal en la parte superior de la app
        appBar: AppBar(
          // Tomamos el valor de Homepage para usarlo en la barra
          title:
          Text(widget.title),
        ),
        body: Center(
          // Añado un padding para que haya espacio con la barra superior de la aplicacion
            child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  // Para que la columna este "pegada" a la parte superior de la pantalla
                  // Realmente, estamos pegados a la parte superior del padding que hemos añadido
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(config.getName()),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController _textEditingController = TextEditingController();
                                return AlertDialog(
                                  content: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: _textEditingController,
                                      decoration: const InputDecoration(hintText: "Introduzca un nombre"),
                                      validator: (value) {
                                        return value!.isNotEmpty ? null : "Introduzca un nombre o pulse Cancelar para salir";
                                      },
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // if (_textEditingController.text != "") {
                                          config.setName(_textEditingController.text);
                                          setState(() {
                                            config = DataController().getActiveConfiguration();
                                          });
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text("Confirmar"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancelar"),
                                    )
                                  ],
                                );
                              }
                          );
                        },
                        child: const Text("Cambiar nombre"),
                      ),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: imagesConfigView.length,
                              itemBuilder: (context, index) {
                                return createSimpleBox(
                                    imagesConfigView[index],
                                    footerImagesConfigView[index],
                                    size, size,
                                        () => { // Vamos a la vista de seleccion
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Selection(
                                                  title: footerImagesConfigView[index],
                                                  options: optionsConfigView[index],
                                                  type: optionsTypeConfigView[index])
                                            )
                                          )
                                        }
                                );
                              }
                          )
                      )
                    ]
                ))),
        floatingActionButton: FloatingActionButton( // Boton para guardar la configuracion

          onPressed: () {
            DataController().getCarConfigRepo().modifyCarConfigurations(config.getActiveConfiguration());
            Navigator.pop(context, false);

            // Se crea una SnackBar cuando se pulsa el botón de guardar. Se le podría añadir una acción como por ejemplo un boton 2deshacer"
            final snackBar = SnackBar(
              content: const Text(
                'Configuración guardada',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            );

            // Muestra en el Scaffold la SnackBar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          tooltip: 'Guardar configuracion',
          child: const Icon(Icons.save),
        ),
      ),
      );
    // return Scaffold(
    //   // Barra horizontal en la parte superior de la app
    //   appBar: AppBar(
    //     // Tomamos el valor de Homepage para usarlo en la barra
    //     title:
    //         Text(widget.title),
    //   ),
    //   body: Center(
    //     // Añado un padding para que haya espacio con la barra superior de la aplicacion
    //     child: Padding(
    //         padding: const EdgeInsets.only(top: 25),
    //         child: Column(
    //           // Para que la columna este "pegada" a la parte superior de la pantalla
    //           // Realmente, estamos pegados a la parte superior del padding que hemos añadido
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Text(config.getName()),
    //             TextButton(
    //                 onPressed: () {
    //                   showDialog(
    //                       context: context,
    //                       builder: (context) {
    //                         TextEditingController _textEditingController = TextEditingController();
    //                         return AlertDialog(
    //                           content: Form(
    //                             key: _formKey,
    //                             child: TextFormField(
    //                               controller: _textEditingController,
    //                               decoration: const InputDecoration(hintText: "Introduzca un nombre"),
    //                               validator: (value) {
    //                                 return value!.isNotEmpty ? null : "Introduzca un nombre o pulse Cancelar para salir";
    //                               },
    //                             ),
    //                           ),
    //                           actions: <Widget>[
    //                             TextButton(
    //                                 onPressed: () {
    //                                   if (_formKey.currentState!.validate()) {
    //                                   // if (_textEditingController.text != "") {
    //                                     config.setName(_textEditingController.text);
    //                                     setState(() {
    //                                       config = DataController().getActiveConfiguration();
    //                                     });
    //                                     Navigator.of(context).pop();
    //                                   }
    //                                 },
    //                                 child: const Text("Confirmar"),
    //                             ),
    //                             TextButton(
    //                                 onPressed: () {
    //                                   Navigator.of(context).pop();
    //                                 },
    //                                 child: const Text("Cancelar"),
    //                             )
    //                           ],
    //                         );
    //                       }
    //                   );
    //                 },
    //                 child: const Text("Cambiar nombre"),
    //             ),
    //             Expanded(
    //                 child: ListView.builder(
    //                   scrollDirection: Axis.vertical,
    //                   itemCount: Images_config_view.length,
    //                   itemBuilder: (context, index) {
    //                     return createSimpleBox(
    //                       Images_config_view[index],
    //                       Footer_images_config_view[index],
    //                       size, size,
    //                       () => { // Vamos a la vista de seleccion
    //                         Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => Selection(
    //                                     title: Footer_images_config_view[index],
    //                                     options: Options_config_view[index],
    //                                     type: OptionsType_config_view[index])
    //                             )
    //                         )
    //                       }
    //                     );
    //                   }
    //                 )
    //             )
    //           ]
    //         ))),
    //   floatingActionButton: FloatingActionButton( // Boton para guardar la configuracion
    //     onPressed: () {
    //       DataController().getCarConfigRepo().modifyCarConfigurations(config.getActiveConfiguration());
    //       Navigator.pop(context, false);
    //
    //       // Se crea una SnackBar cuando se pulsa el botón de guardar. Se le podría añadir una acción como por ejemplo un boton 2deshacer"
    //       final snackBar = SnackBar(
    //         content: const Text(
    //           'Configuración guardada',
    //           style: TextStyle(
    //             color: Colors.black87,
    //             fontSize: 16.0,
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20.0),
    //         ),
    //       );
    //
    //       // Muestra en el Scaffold la SnackBar
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     },
    //     tooltip: 'Guardar configuracion',
    //     child: const Icon(Icons.save),
    //   ),
    // );
  }

  Future<bool> _onBackPressed() async {

    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("¿Está seguro de que desea salir?"),
          content: const Text("\"Si\" para salir sin guardar"),
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: const Text("No"),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pop(true)
              },
              child: const Text("Si"),
            ),
          ],
        ),
    )) ?? false;
  }

}
