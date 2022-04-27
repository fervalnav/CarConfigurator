import 'package:CarConfigurator/views/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  group("Home view tests", () {

    testWidgets("HomePage delete button", (WidgetTester tester) async {

      await tester.pumpWidget(const MaterialApp(home: HomePage(title: "Home")));

      expect(find.text("Configuracion de pruebas 1"), findsOneWidget);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "Eliminar").first);

      await tester.pump();

      expect(find.text("Configuracion de pruebas 1"), findsNothing);
      expect(find.text("Configuracion de pruebas 2"), findsOneWidget);
    });

  });
}