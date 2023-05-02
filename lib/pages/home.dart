import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/chats.dart';
import 'package:test_chat/components/dropdown.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/realm/services/app_services.dart';

class Home extends StatelessWidget {
  void logOut(BuildContext context, AppServices _appServices) {
    _appServices.logOut();
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        title: const Text('Chats'),
        actions: [
          dropDown(),
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
      body: Column(children: [
        Text(appServices.currentUser == null
            ? 'No user'
            : appServices.currentUser!.id),
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
    );
  }
}
