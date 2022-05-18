/// Test de integracion para comprobar un escenario de uso simple
/// En este test, se comprueba que la creación de widgets y la navegacion funciona como se espera

import 'package:CarConfigurator/views/buy.dart';
import 'package:CarConfigurator/views/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:CarConfigurator/main.dart' as app;

void main() {

  // Es necesario crear este singleton para controlar la ejecucion en un dispositivo fisico
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('create_new_config_and_navigate', () {

    testWidgets('Create new configuration and navigate back home',
        (WidgetTester tester) async {

      // Inicializamos la app
      // Notar que tester.pumpAndSettle lo que hace es que fuerza un nuevo frame
      app.main();
      await tester.pumpAndSettle();

      // Buscamos el boton para crear nueva configuracion
      // Le damos a crear una nueva configuracion
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Buscamos el boton para guardar y lo pulsamos
      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      // Realizamos varias comprobaciones
      // Comprobamos que la vista sea Home
      expect(find.byType(HomePage), findsOneWidget);
      // Comprobamos que la vista no sea Buy
      expect(find.byType(BuyPage), findsNothing);
      // Comprobamos que ahora haya una card con los datos de la configuracion por defecto
      expect(find.text("Nueva Configuracion"), findsOneWidget);
    });
  });
}
