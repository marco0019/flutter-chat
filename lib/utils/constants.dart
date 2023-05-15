import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/main.dart';
import 'package:test_chat/pages/home.dart';
import 'package:test_chat/pages/login.dart';
import 'package:test_chat/providers/app_services.dart';
import 'package:test_chat/providers/friend_services.dart';
import 'package:test_chat/providers/person_services.dart';
import 'package:test_chat/providers/theme.dart';

//import 'package:test_chat/providers/users.json';
class CONSTANTS {
  static Uri BASE_URL = Uri.parse('https://realm.mongodb.com');
  static const String ID_APP = "realtimeapp-buvbz";
  static Map<String, Widget Function(BuildContext context)> ROUTES = {
    '/': (context) => const Home(),
    '/login': (context) => const Login()
  };

  /// `assets/users.json`
  static const String USER_FILE_PATH = "assets/users.json";
  static File USER_CREDENTIALS = File(USER_FILE_PATH);
  static final App APP =
      App(AppConfiguration(CONSTANTS.ID_APP, baseUrl: CONSTANTS.BASE_URL));
  /// Multiproviders for my flutter app
  static MultiProvider PROVIDERS = MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(CONSTANTS.APP),
      ),
      ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
      ),
      ChangeNotifierProvider<PersonServices>(
          create: (_) => PersonServices(CONSTANTS.APP)),
      ChangeNotifierProvider<FriendServices>(
        create: (_) => FriendServices(CONSTANTS.APP),
      ),
    ],
    child: const Main(),
  );
}
