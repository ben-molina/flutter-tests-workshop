import 'package:flutter/src/material/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/src/settings/settings_service.dart';

class FakeSettingsService implements SettingsService {
  late ThemeMode _themeMode;

  FakeSettingsService({ThemeMode? themeMode}) : _themeMode = themeMode ?? ThemeMode.system;

  @override
  Future<ThemeMode> themeMode() => Future.value(_themeMode);

  @override
  Future<void> updateThemeMode(ThemeMode theme) async => _themeMode = theme;
}
