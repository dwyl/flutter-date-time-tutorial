// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/cupertino.dart';
import 'package:app/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Initial mount on both pages', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byKey(materialPageKey), findsOneWidget);
    expect(find.byKey(cupertinoPageKey), findsNothing);

    // Tap on `Cupertino` key and page should change
    await tester.tap(find.byKey(cupertinoButtonKey));
    await tester.pumpAndSettle();

    expect(find.byKey(cupertinoPageKey), findsOneWidget);
    expect(find.byKey(materialPageKey), findsNothing);
  });

  testWidgets('Test Material page pickers', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byKey(materialPageKey), findsOneWidget);
    expect(find.byKey(cupertinoPageKey), findsNothing);

    // TEST DATE BUTTON ONLY -----------
    final dateButton = find.byKey(materialDateButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(dateButton);
    await tester.pumpAndSettle();

    // Tap on "OK"
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(materialPageKey), findsOneWidget);

    // TEST TIME BUTTON ONLY -----------
    final timeButton = find.byKey(materialTimeButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(timeButton);
    await tester.pumpAndSettle();

    // Tap on "OK"
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(materialPageKey), findsOneWidget);

    // TEST DATE AND TIME BUTTON -----------
    final dateTimeButton = find.byKey(materialDateTimeButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(dateTimeButton);
    await tester.pumpAndSettle();

    // Tap on "OK" for date
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Tap on "OK" for time
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(materialPageKey), findsOneWidget);
  });

  testWidgets('Test Cupertino page pickers', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byKey(materialPageKey), findsOneWidget);
    expect(find.byKey(cupertinoPageKey), findsNothing);

    // Tap on `Cupertino` key and page should change
    await tester.tap(find.byKey(cupertinoButtonKey));
    await tester.pumpAndSettle();

    // TEST DATE BUTTON ONLY -----------
    final dateButton = find.byKey(cupertinoDateButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(dateButton);
    await tester.pumpAndSettle();

    // Tap on Sat 29th and drag
    await tester.drag(find.text(" Sat 29 "), const Offset(0.0, -32.0), touchSlopY: 0.0, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap outside the picker
    await tester.tapAt(const Offset(0, 0));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(cupertinoPageKey), findsOneWidget);

    // TEST TIME BUTTON ONLY -----------
    final timeButton = find.byKey(cupertinoTimeButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(timeButton);
    await tester.pumpAndSettle();

    // Tap on Sat 29th and drag
    await tester.drag(find.text("01"), const Offset(0.0, -32.0), touchSlopY: 0.0, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap outside the picker
    await tester.tapAt(const Offset(0, 0));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(cupertinoPageKey), findsOneWidget);

    // TEST DATE AND TIME BUTTON -----------
    final dateTimeButton = find.byKey(cupertinoDateTimeButtonKey);

    // Tap on `Cupertino` key and page should change
    await tester.tap(dateTimeButton);
    await tester.pumpAndSettle();

    // Tap on Sat 29th and drag
    await tester.drag(find.text("01"), const Offset(0.0, -32.0), touchSlopY: 0.0, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Tap outside the picker
    await tester.tapAt(const Offset(0, 0));
    await tester.pumpAndSettle();

    // Should show page again
    expect(find.byKey(cupertinoPageKey), findsOneWidget);
  });
}
