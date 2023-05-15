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

/// **ENV class**
///
/// This is the class of `ENVIRONMENT` variables.
///
/// If you want to configure the realm app change [Docs](https://realm.mongodb.com)
abstract class ENV {
  static Uri BASE_URL = Uri.parse('https://realm.mongodb.com');
  static const String ID_APP = "realtimeapp-buvbz";
  static Map<String, Widget Function(BuildContext context)> ROUTES = {
    '/': (context) => const Home(),
    '/login': (context) => const Login()
  };

  /// `assets/users.json`
  static const String USER_FILE_PATH = "assets/users.json";
  static File USER_CREDENTIALS = File(USER_FILE_PATH);
  static final App APP = App(AppConfiguration(ID_APP, baseUrl: BASE_URL));

  /// Multiproviders for my flutter app
  static MultiProvider PROVIDERS = MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(APP),
      ),
      ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
      ),
      ChangeNotifierProvider<PersonServices>(
          create: (_) => PersonServices(APP)),
      ChangeNotifierProvider<FriendServices>(
        create: (_) => FriendServices(APP),
      ),
    ],
    child: const Main(),
  );
}
