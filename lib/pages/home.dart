import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/change_theme.dart';
import 'package:test_chat/components/chats.dart';
import 'package:test_chat/components/dropdown.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/realm/services/app_services.dart';
import 'package:test_chat/utils/globals.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  void logOut(BuildContext context, AppServices _appServices) {
    _appServices.logOut();
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          leading: ChangeTheme(),
          title: const Text('Chats'),
          actions: [
            IconButton(
              onPressed: () {
                // Mostra il popup quando l'utente fa clic sul pulsante.
                popup(context,
                    title: "Do you want to sign out",
                    subtitle: "Are you sure? This action is irreversible!",
                    widgets: [
                      ElevatedButton(
                        child: const Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      ElevatedButton(
                        child: const Text("Sign out"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          logOut(context, appServices);
                        },
                      ),
                    ]);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          child: ListView(children: [
            StreamBuilder(
              builder: (context, snapshot) => Text(snapshot.data.toString()),
              stream: Stream.value(Globals.theme),
            ),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
            chatCard(
                chatName: 'Global',
                lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
                lastDate: DateTime.now(),
                typeOfMessage: 'text',
                isMyMessage: true,
                stateOfMessage: 1),
          ]),
        ));
  }
}
