import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  static const String _themeKey = 'themeMode';

  @override
  ThemeMode build() {
    _loadTheme();
    //  Load Theme when Notifier is initialized
    // default to light theme
    return ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    // toggle between light and dark theme
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    //  Save thenew theme state
    await _saveTheme();
  }

  //  Load Theme From Shared-Preference
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);
    if (themeString != null) {
      state = themeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  // Save theme to shared preference
  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _themeKey,
      state == ThemeMode.dark ? 'dark' : 'light',
    );
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);
