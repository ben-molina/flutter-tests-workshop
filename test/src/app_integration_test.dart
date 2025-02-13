// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/to/widget-testing for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/src/app.dart';
import 'package:workshop/src/settings/settings_controller.dart';

import 'settings/fake_settings_service.dart';

void main() {
  late SettingsController settingsController;

  setUp(() async {
    settingsController = SettingsController(FakeSettingsService());
    await settingsController.loadSettings();
  });

  group('MyApp', () {
    testWidgets('should change to dark mode after tapping on settings', (WidgetTester tester) async {
      // Define a Widget
      final myWidget = MaterialApp(
        home: MyApp(
          settingsController: settingsController,
        ),
      );

      await tester.pumpWidget(myWidget);

      // Verify the Settings button is visible
      final settingsButtonFinder = find.byKey(Key('settings'));
      expect(settingsButtonFinder, findsOneWidget);

      // Tap the button to navigate to Settings
      await tester.tap(settingsButtonFinder);
      await tester.pumpAndSettle();

      // Tap the dropdown
      final dropDownFinder = find.byType(DropdownButton<ThemeMode>);
      await tester.tap(dropDownFinder);
      await tester.pumpAndSettle();

      // Select the light theme option
      final lightThemeMenuItemFinder = find.descendant(
        of: find.byType(DropdownMenuItem<ThemeMode>),
        matching: find.text('Light Theme'),
      );
      await tester.tap(lightThemeMenuItemFinder);
      await tester.pumpAndSettle();

      // Verify the Light Theme option is selected after tapping it
      expect(find.descendant(of: dropDownFinder, matching: find.text('Light Theme')), findsOneWidget);
      expect(find.descendant(of: dropDownFinder, matching: find.text('System Theme')), findsNothing);
    });
  });
}
