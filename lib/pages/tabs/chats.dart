import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/chats/chat_item.dart';
import 'package:test_chat/realm/services/app_services.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context);
    return ListView(children: [
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: appServices.box.read('password') ?? 'null',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: false,
          stateOfMessage: 1),
      ChatCard(
          chatName: "cssdcsc",
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'skjvshdbfv',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'Global',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
    ]);
  }
}
