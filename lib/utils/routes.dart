import 'package:flutter/material.dart';
import 'package:test_chat/components/change_theme.dart';
import 'package:test_chat/main.dart';
import 'package:test_chat/pages/home.dart';
import 'package:test_chat/pages/login.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {'/': (context) => Home(), '/login': (context) => Login()};
}
