import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/pages/home.dart';
import 'package:test_chat/pages/login.dart';
import 'package:test_chat/realm/services/app_services.dart';
import 'package:test_chat/realm/services/realm_services.dart';

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
    final currentUser = Provider.of<AppServices>(context, listen: false).currentUser;

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: 'Chat',
        theme: ThemeData.dark(useMaterial3: true),
        initialRoute: currentUser != null ? '/' : '/login',
        routes: {
          '/': (context) => Home(),
          '/login': (context) => Login()
        },
      ),
    );
  }
}
