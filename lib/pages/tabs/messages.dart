import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageList createState() => _MessageList();
}

class _MessageList extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: const [
            CircleAvatar(
              backgroundImage: NetworkImage('prprprprprppp'),
            ),
            Text('title')
          ]),
        ),
        body: ListView.builder(
          itemCount: ['prova'].length + 1,
          itemBuilder: (BuildContext context, int index) => const Text('prova'),
        ));
  }
}
