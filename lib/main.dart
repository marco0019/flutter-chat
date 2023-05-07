import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/realm/services/realm_services.dart';
import 'package:test_chat/utils/routes.dart';
import 'package:test_chat/utils/theme.dart';
import 'realm/services/app_services.dart';

final box = GetStorage();
void init() async => await GetStorage.init();
void main() {
  init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(
          'realtimeapp-buvbz',
          Uri.parse('https://realm.mongodb.com'),
        ),
      ),
      ChangeNotifierProxyProvider<AppServices, RealmServices?>(
        // RealmServices can only be initialized only if the user is logged in.
        create: (context) => null,
        update: (BuildContext context, AppServices appServices,
            RealmServices? realmServices) {
          return appServices.app.currentUser != null
              ? RealmServices(appServices.app)
              : null;
        },
      ),
      ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context, listen: true);
    final theme = Provider.of<ThemeModel>(context);
    return WillPopScope(
        child: MaterialApp(
          title: 'My App',
          themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          initialRoute: currentUser.isRegisteredLocal() ? '/' : '/login',
          routes: routes(),
        ),
        onWillPop: () async => false);
  }
}