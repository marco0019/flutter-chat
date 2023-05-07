import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget friendRequestCard(
        {required user,
        required dateRequest,
        required onAccept,
        required onRefused}) =>
    InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  child: Text(user.trim()[0].toUpperCase(),
                      style: const TextStyle(fontSize: 20)),
                )),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${DateTime.now().difference(dateRequest).inDays} days ago",
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: onRefused(),
                color: Colors.red,
                icon: const Icon(FontAwesomeIcons.x)),
            const SizedBox(width: 16.0),
            IconButton(
                onPressed: onAccept(),
                color: Colors.green,
                icon: const Icon(FontAwesomeIcons.check)),
          ],
        ),
      ),
    );
