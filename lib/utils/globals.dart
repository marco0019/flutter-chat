import 'package:flutter/material.dart';

class Globals with ChangeNotifier {
  static bool theme = false;
  static void changeTheme() => theme = !theme;
}
