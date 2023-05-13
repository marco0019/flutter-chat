import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/app_bar/change_theme.dart';
import 'package:test_chat/components/app_bar/logout.dart';
import 'package:test_chat/pages/tabs/chats.dart';
import 'package:test_chat/pages/tabs/friends_requests.dart';
import 'package:test_chat/pages/tabs/settings.dart';
import 'package:test_chat/providers/app_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appServices = context.watch<AppServices>();

    final List<Widget> pages = [Chats(), FriendList(), Settings()];
    return DefaultTabController(
        length: pages.length,
        child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 0,
                leading: const ChangeTheme(),
                title: const Text('Chats'),
                actions: [logout(context, appServices)],
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  splashBorderRadius:
                      const BorderRadius.all(Radius.elliptical(0, 50)),
                  tabs: [
                    Tab(
                      child: Row(children: const [
                        Text('Chats'),
                        SizedBox(width: 15),
                        Icon(FontAwesomeIcons.house, size: 15)
                      ]),
                    ),
                    Tab(
                      child: Row(children: const [
                        Text('Friends'),
                        SizedBox(width: 15),
                        Icon(FontAwesomeIcons.userGroup, size: 15)
                      ]),
                    ),
                    Tab(
                      child: Row(children: const [
                        Text('Settings'),
                        SizedBox(width: 15),
                        Icon(FontAwesomeIcons.gear, size: 15)
                      ]),
                    ),
                  ],
                )),
            body: TabBarView(children: pages)));
  }
}
