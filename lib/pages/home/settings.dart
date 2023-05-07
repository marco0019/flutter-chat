import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        rowItem(FontAwesomeIcons.a, 'Change theme', const Text('prova')),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.sun),
              padding: const EdgeInsets.all(0),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: Text('Change theme'),
            ),
          ],
        )
      ],
    );
  }

  Widget rowItem(IconData icon, String label, Widget? widget) => Row(
        children: [
          Padding(padding: const EdgeInsets.all(20),child: Icon(icon)),
          const SizedBox(width: 20),
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 20),),
          ),
          widget ?? const Text('')
        ],
      );
}
