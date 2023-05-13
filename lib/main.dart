import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/realm/models/friend_request/friend_handler.dart';
import 'package:test_chat/realm/services/realm_services.dart';
import 'package:test_chat/utils/constants.dart';
import 'package:test_chat/utils/routes.dart';
import 'package:test_chat/utils/theme.dart';
import 'realm/services/app_services.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(CONSTANTS.ID_APP, CONSTANTS.BASE_URL),
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
      ChangeNotifierProvider<FriendHandler>(
        create: (_) {
          final appServices = _.watch<AppServices>();
          return FriendHandler(appServices.app);
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
          routes: routes(),
        ),
        onWillPop: () async => false);
  }
}
