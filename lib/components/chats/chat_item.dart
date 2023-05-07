import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  final String chatName;
  final String lastMessage;
  final DateTime lastDate;
  final String typeOfMessage;
  final int stateOfMessage;
  final bool isMyMessage;
  const ChatCard(
      {super.key, required this.chatName,
      required this.lastMessage,
      required this.lastDate,
      required this.typeOfMessage,
      required this.stateOfMessage,
      required this.isMyMessage});
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
                   child: Text(chatName.trim()[0].toUpperCase(), style: const TextStyle(fontSize: 20),),
                  )),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                DateFormat('HH:mm').format(lastDate),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
}

IconData stateMessage({required isMy, required state}) {
  if (isMy) {
    if (state == 0) {
      return FontAwesomeIcons.timeline;
    } else {
      return FontAwesomeIcons.checkDouble;
    }
  } else {
    return FontAwesomeIcons.circleNodes;
  }
}
