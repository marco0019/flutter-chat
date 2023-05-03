import 'package:flutter/material.dart';
import 'package:test_chat/components/change_theme.dart';
import 'package:test_chat/components/popup.dart';

AppBar appBar(BuildContext context, {String? title, List<Widget>? actions}) {
  return AppBar(
    leading: ChangeTheme(),
    title: const Text('Chats'),
    actions: actions,
  );
}
