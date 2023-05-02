import 'package:flutter/material.dart';

Future popup(BuildContext context, {title, subtitle, widgets}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
        title: Text(title), content: Text(subtitle), actions: widgets),
  );
}
