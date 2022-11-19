import 'package:bond/core/app_localizations.dart';
import 'package:flutter/material.dart';

import 'bond_popup_menu_item.dart';

class BondPopMenuButton extends StatelessWidget {
  const BondPopMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      onSelected: (Menu item) {},
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        BondPopupBondMenuItem(
          value: Menu.theme,
          icon: const Icon(Icons.color_lens_rounded, color: Colors.black),
          title: context.localizations.popup_menu_theme,
        ),
        BondPopupBondMenuItem(
          value: Menu.language,
          icon: const Icon(Icons.language, color: Colors.black),
          title: context.localizations.popup_menu_language_title,
        ),
        BondPopupBondMenuItem(
          value: Menu.notifications,
          icon: const Icon(Icons.notifications_rounded, color: Colors.black),
          title: context.localizations.popup_menu_notification_center,
        ),
        BondPopupBondMenuItem(
          value: Menu.logout,
          icon: const Icon(Icons.logout, color: Colors.black),
          title: context.localizations.popup_menu_logout,
        ),
      ],
    );
  }
}
