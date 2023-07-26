// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Initial mount on both pages', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our counter starts at 0.
    expect(find.byKey(materialPageKey), findsOneWidget);
    expect(find.byKey(cupertinoPageKey), findsNothing);

    // Tap on `Cupertino` key and page should change
    await tester.tap(find.byKey(cupertinoButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(cupertinoPageKey), findsOneWidget);
    expect(find.byKey(materialPageKey), findsNothing);
  });
}
