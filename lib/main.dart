import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/providers/friend_services.dart';
import 'package:test_chat/providers/person_services.dart';
import 'package:test_chat/providers/theme.dart';
import 'package:test_chat/utils/constants.dart';
import 'providers/app_services.dart';

void main() {
  final App app =
      App(AppConfiguration(CONSTANTS.ID_APP, baseUrl: CONSTANTS.BASE_URL));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(app),
      ),
      ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
      ),
      ChangeNotifierProvider<PersonServices>(
          create: (_) => PersonServices(app)),
      ChangeNotifierProvider<FriendServices>(
        create: (_) => FriendServices(app),
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
                  true).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.indigo))
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
