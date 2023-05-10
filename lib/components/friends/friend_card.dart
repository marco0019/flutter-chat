import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/services/app_services.dart';

class FriendRequests extends StatefulWidget {
  final List<Widget> cards;
  FriendRequests({super.key, required this.cards});
  @override
  _FriendRequests createState() => _FriendRequests();
}

class _FriendRequests extends State<FriendRequests> {
  final List<String> cards = ['scsdc', 'svdsdfv', 'asdcascd'];
  void _removeCard(int index) => setState(() => cards.removeAt(index));
  final TextEditingController _friendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AppServices app = Provider.of<AppServices>(context);
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    padding: const EdgeInsets.all(0),
                  ),
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
