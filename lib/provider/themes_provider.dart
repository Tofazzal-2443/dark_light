import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  // Define a key for SharedPreferences
  static const String themeModeKey = 'themeMode';

  ThemeProvider() {
    // Load the theme mode from SharedPreferences during initialization
    loadThemeMode();
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    saveThemeMode(); // Save the theme mode to SharedPreferences
    notifyListeners();
  }

  // Save the theme mode to SharedPreferences
  void saveThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themeModeKey, themeMode.index);
  }

  // Load the theme mode from SharedPreferences
  void loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? savedThemeMode = prefs.getInt(themeModeKey);

    if (savedThemeMode != null) {
      themeMode = ThemeMode.values[savedThemeMode];
      notifyListeners();
    }
  }
}


class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}