import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_chat/utils/globals.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});
  @override
  _ChangeTheme createState() => _ChangeTheme();
}

class _ChangeTheme extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, snapshot) => IconButton(
            onPressed: () => Globals.changeTheme(),
            icon: Icon(snapshot.data! ? FontAwesomeIcons.moon : FontAwesomeIcons.sun)),
        stream: Stream.value(Globals.theme));
  }
}
