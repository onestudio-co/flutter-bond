import 'package:flutter/material.dart';

enum Menu { theme, language, logout, notifications }

class BondPopupBondMenuItem extends PopupMenuItem<Menu> {
  BondPopupBondMenuItem({
    Key? key,
    required Menu value,
    required String title,
    required Icon icon,
  }) : super(
          key: key,
          value: value,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
        );
}
