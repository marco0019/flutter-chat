import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/chats/chat_item.dart';
import 'package:test_chat/providers/app_services.dart';
import 'package:test_chat/providers/person_services.dart';

class Chats extends StatelessWidget {
  final AppServices appServices;
  Chats({super.key, required this.appServices});
  @override
  Widget build(BuildContext context) {
    //final user = context.select((PersonServices usr) => usr.currentPerson);
    final user = context.watch<PersonServices>().currentPerson;
    return ListView(children: [
      ChatCard(
          chatName: user.nickName,
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: user.userId,
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: false,
          stateOfMessage: 1),
      ChatCard(
          chatName: user.firstName,
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'lkm',
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: 'lkm',
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
