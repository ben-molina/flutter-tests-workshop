import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/src/settings/settings_controller.dart';
import 'package:workshop/src/settings/settings_view.dart';

import 'fake_settings_service.dart';

void main() {
  late SettingsController settingsController;

  setUp(() async {
    settingsController = SettingsController(FakeSettingsService());
    await settingsController.loadSettings();
  });

  group('SettingsView', () {
    testWidgets('should display its dropdown with the systems theme selected', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: SettingsView(
          controller: settingsController,
        ),
      );
      await tester.pumpWidget(widget);

      // Verify the title
      expect(find.text('Settings'), findsOneWidget);

      // Verify the default value
      final dropDownFinder = find.byType(DropdownButton<ThemeMode>);
      expect(dropDownFinder, findsOneWidget);
      final systemsThemeMenuItem = find.descendant(of: dropDownFinder, matching: find.text('System Theme'));
      expect(systemsThemeMenuItem, findsOneWidget);

      // Open the dropdown and validate other options
      await tester.tap(dropDownFinder);
      await tester.pumpAndSettle();

      // Verify the other options are shown
      final dropDownMenuItem = find.byType(DropdownMenuItem<ThemeMode>);
      expect(dropDownMenuItem, findsNWidgets(4)); // the menu items plus the button in the back
      final lightThemeMenuItemFinder = find.descendant(of: dropDownMenuItem, matching: find.text('Light Theme'));
      expect(lightThemeMenuItemFinder, findsOneWidget);
      final darkThemeMenuItemFinder = find.descendant(of: dropDownMenuItem, matching: find.text('Dark Theme'));
      expect(darkThemeMenuItemFinder, findsOneWidget);
    });
  });
}
