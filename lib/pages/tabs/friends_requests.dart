import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/models/friend_request/friend_handler.dart';
import 'package:test_chat/realm/models/friend_request/friends.dart';

class FriendList extends StatelessWidget {
  FriendList({super.key});
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final friends = Provider.of<FriendHandler>(context, listen: false);
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
              onPressed: () => print('manda richiesta'),
              icon: const Icon(Icons.send),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),
        const Divider(),
        ListTile(
          title: const Text('Friends'),
          isThreeLine: true,
          subtitle: [Friends(ObjectId(), 'prova', 'prova1', 'waiting')].isEmpty
              ? const Text('You have no friends yet.')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Friends(ObjectId(), 'prova', 'prova1', 'waiting')]
                      .map((friend) => Text(
                            '- ${friend.senderName}',
                            style: const TextStyle(fontSize: 16),
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