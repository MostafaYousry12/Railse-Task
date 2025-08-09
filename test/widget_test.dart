// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:railse_task/main.dart';

void main() {
  testWidgets('Task Manager App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainView());

    // Verify that the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Wait for the app to fully load
    await tester.pumpAndSettle();
    
    // Verify that tasks are displayed
    expect(find.text('Order-1043'), findsOneWidget);
    expect(find.text('Arrange Pickup'), findsOneWidget);
    expect(find.text('Sandhya'), findsOneWidget);
  });
}
