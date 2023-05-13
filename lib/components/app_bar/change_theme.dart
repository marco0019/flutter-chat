import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/providers/theme.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});
  @override
  _ChangeTheme createState() => _ChangeTheme();
}

class _ChangeTheme extends State<ChangeTheme> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(FontAwesomeIcons.moon);
      }
      return const Icon(FontAwesomeIcons.sun);
    },
  );
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return Switch(
      thumbIcon: thumbIcon,
      value: theme.isDarkMode,
      activeColor: Colors.purple,
      onChanged: (bool value) => theme.toggleTheme(),
    );
  }
}
