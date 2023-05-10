import 'package:flutter/material.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/components/widgets.dart';

class FriendItem extends StatefulWidget {
  final String friendName;
  FriendItem({super.key, required this.friendName});
  @override
  _FriendItem createState() => _FriendItem();
}

class _FriendItem extends State<FriendItem> {
  void removeWidget() {
    BuildContext context = this.context;
    context.findRenderObject()?.dispose();
    context.visitChildElements((element) {
      element.visitChildElements((child) {
        child.visitChildren((widget) {
          widget.findRenderObject()?.dispose();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    child: Text(widget.friendName.trim()[0].toUpperCase(),
                        style: const TextStyle(fontSize: 20)),
                  )),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.friendName,
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
                                  removeWidget();
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
