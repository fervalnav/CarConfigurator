import 'package:CarConfigurator/backend/DataController.dart';
import 'package:CarConfigurator/views/buy.dart';
import 'package:CarConfigurator/views/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:CarConfigurator/main.dart' as app;


void main() {

  group("BuyPage view tests", () {

    testWidgets("BuyPage save button should save the configuration and change to home view", (WidgetTester tester) async {

      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(BuyPage), findsNothing);
      expect(find.text("Nueva Configuracion"), findsOneWidget);
    });

  });
}
