import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/app_bar/change_theme.dart';
import 'package:test_chat/components/app_bar/logout.dart';
import 'package:test_chat/components/dropdown.dart';
import 'package:test_chat/providers/app_services.dart';
import 'package:test_chat/providers/person_services.dart';

class Settings extends StatefulWidget {
  AppServices appServices;
  Settings({super.key, required this.appServices});
  @override
  createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final currentPerson = context.watch<PersonServices>().currentPerson;
    return ListView(
      children: [
        Text(currentPerson.isValid ? currentPerson.email : 'not valid'),
        rowItem(FontAwesomeIcons.a, 'Change theme', const ChangeTheme()),
        rowItem(
            FontAwesomeIcons.a,
            'Prova dropdown',
            MenuButton(
              menuItems: [
                MenuItemButton(
                    leadingIcon: const Icon(FontAwesomeIcons.accessibleIcon),
                    onPressed: () {},
                    child: const Text('prova')),
                MenuItemButton(
                    leadingIcon: const Icon(FontAwesomeIcons.accessibleIcon),
                    onPressed: () {},
                    child: const Text('prova')),
                MenuItemButton(
                    leadingIcon: const Icon(FontAwesomeIcons.accessibleIcon),
                    onPressed: () {},
                    child: const Text('prova')),
                MenuItemButton(
                    leadingIcon: const Icon(FontAwesomeIcons.accessibleIcon),
                    onPressed: () {},
                    child: const Text('prova'))
              ],
            )),
        rowItem(FontAwesomeIcons.user, 'Log out', logout(context, widget.appServices)),
        rowItem(
            FontAwesomeIcons.iceCream,
            currentPerson.isValid ? currentPerson.email : 'not valid',
            Text(currentPerson.isValid ? currentPerson.password : 'not valid')),
        Column(
          children: [Text('prova')],
        )
      ],
    );
  }

  Widget rowItem(IconData icon, String label, Widget? widget) => Row(
        children: [
          Padding(padding: const EdgeInsets.all(20), child: Icon(icon)),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          widget ?? const Text('')
        ],
      );
}
