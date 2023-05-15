import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/friends/friend_item.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/providers/friend_services.dart';
import 'package:test_chat/providers/person_services.dart';

class FriendList extends StatefulWidget {
  FriendServices friendServices;
  FriendList({super.key, required this.friendServices});
  @override
  createState() => _FriendList();
}

class _FriendList extends State<FriendList> {
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final currentPerson = context.watch<PersonServices>().currentPerson;
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: loginField(
                _friendController,
                hintText: 'Enter nickname...',
              ),
            ),
            IconButton(
              onPressed: () => widget.friendServices.sendRequest(
                  currentName: currentPerson.nickName,
                  friendName: _friendController.text),
              icon: const Icon(Icons.send),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),
        const Divider(),
        ListTile(
          title: const Text('Friends'),
          isThreeLine: true,
          subtitle: widget.friendServices.friends.isEmpty
              ? const Text('You have no friends yet.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.friendServices.friends
                      .map((friend) => FriendItem(
                            key: Key(friend.id.toString()),
                            friendName: friend.receivedName,
                            onDelete: () => widget.friendServices.deleteRequest(
                                currentName: currentPerson.nickName,
                                receivedName: friend.receivedName),
                          ))
                      .toList(),
                ),
        ),
      ],
    );
  }
}

/*handleFriend.sendRequest(
                currentName: appServices.handlePerson.currentPerson.nickName,
                friendName: _friendController.text)*/