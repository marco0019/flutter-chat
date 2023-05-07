import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/app_bar/change_theme.dart';
import 'package:test_chat/components/app_bar/logout.dart';
import 'package:test_chat/components/chats/chat_item.dart';
import 'package:test_chat/components/friends/friend_list.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/pages/home/chats.dart';
import 'package:test_chat/pages/home/settings.dart';
import 'package:test_chat/realm/services/app_services.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final TextEditingController _friendController = TextEditingController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context, listen: false);

    final List<Widget> pages = [Chats(), FriendRequests(), Settings()];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 60,
                leading: const ChangeTheme(),
                title: const Text('Chats'),
                actions: [logout(context, appServices)],
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                )),
            body: TabBarView(children: pages)));
  }
}
