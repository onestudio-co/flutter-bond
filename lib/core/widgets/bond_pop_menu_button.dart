import 'package:flutter/material.dart';

enum Menu { theme, language, logout }

class BondPopMenuButton extends StatelessWidget {
  const BondPopMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      onSelected: (Menu item) {},
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        PopupMenuItem<Menu>(
          value: Menu.theme,
          child: Row(
            children: const [
              Icon(Icons.color_lens_rounded),
              SizedBox(width: 8),
              Text('Theme'),
            ],
          ),
        ),
        PopupMenuItem<Menu>(
          value: Menu.language,
          child: Row(
            children: const [
              Icon(Icons.language),
              SizedBox(width: 8),
              Text('Change Language'),
            ],
          ),
        ),
        PopupMenuItem<Menu>(
          value: Menu.logout,
          child: Row(
            children: const [
              Icon(Icons.logout),
              SizedBox(width: 8),
              Text('Logout'),
            ],
          ),
        ),
      ],
    );
  }
}
