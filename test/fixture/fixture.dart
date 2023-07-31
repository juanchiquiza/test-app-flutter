import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

// Generate the Material app to test widgets
Future<void> pumpMaterialApp(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Container(
          child: child,
        ),
      ),
    ),
  );
}
