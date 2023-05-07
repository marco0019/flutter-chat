import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/components/friends/friend_card.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/services/app_services.dart';

class FriendRequests extends StatefulWidget {
  @override
  _FriendRequests createState() => _FriendRequests();
}

class _FriendRequests extends State<FriendRequests> {
  List<String> cards = ['Card 1', 'Card 2', 'Card 3', 'Card 4'];
  void _removeCard(int index) => setState(() => cards.removeAt(index));
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AppServices app = Provider.of<AppServices>(context, listen: true);
    return ListView.builder(
        itemCount: cards.length + 1,
        itemBuilder: (BuildContext context, int index) => index == 0
            ? Row(
                children: [
                  Expanded(
                    child: loginField(
                      _friendController,
                      hintText: 'Enter name of your friend...',
                    ),
                  ),
                  Container(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    padding: const EdgeInsets.all(0),
                  )),
                ],
              )
            : friendCard(index));
  }

  Widget friendCard(int index) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    child: Text(cards[index - 1].trim()[0].toUpperCase(),
                        style: const TextStyle(fontSize: 20)),
                  )),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cards[index - 1],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${DateTime.now().difference(DateTime.now()).inDays} days ago",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              deleteButton(context,
                  onPressed: () => popup(context,
                          title: 'Friend request',
                          subtitle: 'Refuse thi request?',
                          widgets: [
                            ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('cancel')),
                            ElevatedButton(
                                onPressed: () {
                                  _removeCard(index - 1);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Remove'))
                          ])),
              const SizedBox(width: 16.0),
              okButton(context, 'Accept', onPressed: () {}),
            ],
          ),
        ),
      );
}
