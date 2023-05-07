import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/utils/theme.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});
  @override
  _ChangeTheme createState() => _ChangeTheme();
}

class _ChangeTheme extends State<ChangeTheme> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return IconButton(
        onPressed: () => theme.toggleTheme(),
        icon: Icon(
            theme.isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
            size: 20,));
  }
}
