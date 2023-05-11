import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/services/app_services.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendList createState() => _FriendList();
}

class _FriendList extends State<FriendList> {
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appServices = Provider.of<AppServices>(context);
    return ListView(children: [
      Row(
        children: [
          Expanded(
            child: loginField(
              _friendController,
              hintText: 'Enter nickname...',
            ),
          ),
          IconButton(
            onPressed: () => appServices.handleFriend.sendRequest(
                currentName: appServices.handlePerson.currentPerson.nickName,
                friendName: _friendController.text), // Manda richiesta
            icon: const Icon(Icons.send),
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    ]);
  }
}
