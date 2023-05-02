import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget chatCard(
    {required chatName,
    required lastMessage,
    required lastDate,
    required typeOfMessage,
    required stateOfMessage,
    required isMyMessage}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1682999029155-d8b26349468f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3135&q=80'),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  lastMessage,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Text(
            DateFormat('HH:mm').format(lastDate),
            style: const TextStyle(
              fontSize: 12.0,
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
