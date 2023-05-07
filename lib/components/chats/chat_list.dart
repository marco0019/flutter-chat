import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  final user;
  const ChatList({super.key, required this.user});
  @override
  _ChatList createState() => _ChatList(user: user);
}

class _ChatList extends State<ChatList> {
  final String user;
  // Fare la richiesta alla collezzione delle chat
  // Prendere tutti gli id delle chat
  // prendere tutte le iformazioni delle chat con gli ids trovati
  _ChatList({required this.user});

  Future<void> getChatList() async {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
