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
    final user = Provider.of<PersonServices>(context);
    return ListView(children: [
      ChatCard(
          chatName: user.currentPerson.nickName,
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: true,
          stateOfMessage: 1),
      ChatCard(
          chatName: user.currentPerson.userId,
          lastMessage: 'ciaobdfbddfbdfgbdgbdfgbdg dfgbdfgbdfd dfgbdfboo',
          lastDate: DateTime.now(),
          typeOfMessage: 'text',
          isMyMessage: false,
          stateOfMessage: 1),
      ChatCard(
          chatName: user.currentPerson.firstName,
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
