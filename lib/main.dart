import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/utils/globals.dart';
import 'package:test_chat/utils/routes.dart';
import 'realm/services/app_services.dart';
import 'realm/services/realm_services.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(
            'realtimeapp-buvbz', Uri.parse('https://realm.mongodb.com'))),
    ChangeNotifierProxyProvider<AppServices, RealmServices?>(
// RealmServices can only be initialized only if the user is logged in.
        create: (context) => null,
        update: (BuildContext context, AppServices appServices,
            RealmServices? realmServices) {
          return appServices.app.currentUser != null
              ? RealmServices(appServices.app)
              : null;
        }),
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentUser =
        Provider.of<AppServices>(context, listen: false).currentUser;
    return WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
          title: 'Chat',
          darkTheme: ThemeData.dark(useMaterial3: true),
          theme: ThemeData.light(useMaterial3: true),
          themeMode: Globals.currentTheme(context),
          initialRoute: currentUser != null ? '/' : '/login',
          routes: routes(),
        ));
  }
}