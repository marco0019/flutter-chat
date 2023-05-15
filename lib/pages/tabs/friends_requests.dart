import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/friends/friend_item.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/models/friend_request/friends.dart';
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
    final friendList =
        context.select((FriendServices services) => services.friends);
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
          subtitle: friendListElement(friendList: friendList),
        ),
      ],
    );
  }

  Widget friendListElement({required List<Friends> friendList}) {
    if (friendList.isEmpty) {
      return const Text('You have no friends yet.');
    } else {
      final friendItems = <Widget>[];
      int index = 0;
      while (index < friendList.length) {
        if (friendList[index].isValid) {
          friendItems.add(FriendItem(
            friendName: friendList[index].receivedName,
            onDelete: () =>
                widget.friendServices.deleteRequest(friend: friendList[index]),
          ));
        } else {
          friendItems.add(const SizedBox());
        }
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: friendItems,
      );
    }
  }
}
/*
          subtitle: friendList.isEmpty
              ? const Text('You have no friends yet.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: friendList
                      .map((friend) => friend.isValid
                          ? FriendItem(
                              friendName: friend.receivedName,
                              onDelete: () => widget.friendServices
                                  .deleteRequest(
                                      friend: friend),
                            )
                          : const SizedBox())
                      .toList()),*/