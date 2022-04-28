import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/views/buy.dart';
import 'package:CarConfigurator/views/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:CarConfigurator/main.dart' as app;


void main() {

  group("HomePage view tests", () {

    testWidgets("HomePage boton Eliminar should delete configuration", (WidgetTester tester) async {

      DataController.restart();

      await tester.pumpWidget(const MaterialApp(home: HomePage(title: "Home")));

      expect(find.text("Configuracion de pruebas 1"), findsOneWidget);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "Eliminar").first);

      await tester.pumpAndSettle();

      expect(find.text("Configuracion de pruebas 1"), findsNothing);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);
    });


    testWidgets("HomePage boton Configurar should change view to configure the selected one", (WidgetTester tester) async {

      DataController.restart();

      await tester.pumpWidget(const MaterialApp(home: HomePage(title: "Home")));

      expect(find.text("Configuracion de pruebas 1"), findsOneWidget);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(BuyPage), findsNothing);

      await tester.tap(find.widgetWithText(TextButton, "Configurar").last);

      await tester.pumpAndSettle();

      expect(find.text("Configuracion de pruebas 1"), findsNothing);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);
      expect(find.byType(HomePage), findsNothing);
      expect(find.byType(BuyPage), findsOneWidget);
    });

  });
}