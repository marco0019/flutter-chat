import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final List<MenuItemButton> menuItems;
  const MenuButton({Key? key, required this.menuItems}) : super(key: key);

  @override
  _DropdownButtonState createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<MenuButton> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> itemsMenu() {
    final menuItems = <Widget>[];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return FilledButton.tonal(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Text('Show menu'),
        );
      },
      menuChildren: widget.menuItems.map((item) => item).toList(),
    );
  }
}
