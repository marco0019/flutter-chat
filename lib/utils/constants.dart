import 'package:flutter/material.dart';
import 'package:test_chat/pages/home.dart';
import 'package:test_chat/pages/login.dart';

class CONSTANTS {
  static Uri BASE_URL = Uri.parse('https://realm.mongodb.com');
  static const String ID_APP = "realtimeapp-buvbz";
  static Map<String, Widget Function(BuildContext context)> ROUTES = {
    '/': (context) => const Home(),
    '/login': (context) => const Login()
  };
}
