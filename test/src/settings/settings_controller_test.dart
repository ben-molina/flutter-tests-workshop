import 'package:flutter/src/material/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/src/settings/settings_controller.dart';

import 'fake_settings_service.dart';

void main() {
  group('Settings Controller', () {
    late FakeSettingsService fakeSettingsService;
    setUp(() {
      fakeSettingsService = FakeSettingsService();
    });

    test('should load the systems theme by default', () async {
      final settingsController = SettingsController(fakeSettingsService);
      await settingsController.loadSettings();
      expect(settingsController.themeMode, ThemeMode.system);
    });

    test('should load the light theme if the service has that theme', () async {
      fakeSettingsService.updateThemeMode(ThemeMode.light);
      final settingsController = SettingsController(fakeSettingsService);
      await settingsController.loadSettings();
      expect(settingsController.themeMode, ThemeMode.light);
    });

    test('should load the dark theme after the controller updates the theme', () async {
      final settingsController = SettingsController(fakeSettingsService);
      await settingsController.loadSettings();
      await settingsController.updateThemeMode(ThemeMode.dark);
      expect(settingsController.themeMode, ThemeMode.dark);

      // For the sake of example we include this, but its not a recommended
      // practice, since you should not test fakes behavior.
      await expectLater(fakeSettingsService.themeMode(), completion(ThemeMode.dark));
    });
  });
}
