import 'package:flutter/material.dart';

class Globals with ChangeNotifier {
  static bool _theme = true;
  static bool get theme => _theme;
  static set theme(bool value) => _theme = value;
  static void changeTheme() => _theme = !_theme;
  static ThemeMode currentTheme(BuildContext context) => theme ? ThemeMode.dark : ThemeMode.light;
}
