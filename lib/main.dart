import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/providers/friend_services.dart';
import 'package:test_chat/providers/realm_services.dart';
import 'package:test_chat/providers/theme.dart';
import 'package:test_chat/utils/constants.dart';
import 'providers/app_services.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(CONSTANTS.ID_APP, CONSTANTS.BASE_URL),
      ),
      ChangeNotifierProxyProvider<AppServices, RealmServices?>(
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
      ChangeNotifierProvider<FriendServices>(
        create: (_) {
          return FriendServices(Provider.of<AppServices>(_, listen: false).app);
        },
      ),
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return WillPopScope(
        child: MaterialApp(
          title: 'Flutter chat',
          themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(
              useMaterial3:
                  true) /*.copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.orange))*/
          ,
          darkTheme: ThemeData.dark(useMaterial3: true),
          initialRoute: Provider.of<AppServices>(context, listen: false)
                      .app
                      .currentUser ==
                  null
              ? '/login'
              : '/',
          routes: CONSTANTS.ROUTES,
        ),
        onWillPop: () async => false);
  }
}
