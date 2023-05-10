import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/dropdown.dart';
import 'package:test_chat/components/friends/friend_item.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/services/realm_services.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendList createState() => _FriendList();
}

class _FriendList extends State<FriendList> {
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<RealmServices>(context);
    return ListView(children: [
      Row(
        children: [
          Expanded(
            child: loginField(
              _friendController,
              hintText: 'Enter name of your friend...',
            ),
          ),
          IconButton(
            onPressed: () {
            }, // Manda richiesta
            icon: const Icon(Icons.send),
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    ]);
  }
}
