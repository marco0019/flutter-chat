import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget friendRequestCard({required user, required dateRequest}) => Container(
    child: InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: () {},
      child: Padding(padding: const EdgeInsets.all(10), child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(10),child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1682999029155-d8b26349468f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3135&q=80'),
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
                  DateFormat('HH:mm').format(dateRequest),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.x)),
          const SizedBox(width: 16.0),
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.check)),
        ],
      ),
      ),
    )
);