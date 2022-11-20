import 'package:bond/core/app_localizations.dart';
import 'package:bond/features/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bond_popup_menu_item.dart';

class BondPopMenuButton extends StatelessWidget {
  const BondPopMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();
    return PopupMenuButton<Menu>(
      onSelected: (Menu item) => _onSelected(context, item),
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        BondPopupBondMenuItem(
          value: Menu.theme,
          icon: Icon(
            Icons.color_lens_rounded,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: context.localizations.popup_menu_theme,
        ),
        BondPopupBondMenuItem(
          value: Menu.language,
          icon: Icon(
            Icons.language,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: context.localizations.popup_menu_language_title,
        ),
        if (appBloc.state.user != null)
          BondPopupBondMenuItem(
            value: Menu.notifications,
            icon: Icon(
              Icons.notifications_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: context.localizations.popup_menu_notification_center,
          ),
        if (appBloc.state.user != null)
          BondPopupBondMenuItem(
            value: Menu.logout,
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: context.localizations.popup_menu_logout,
          ),
      ],
    );
  }

  void _onSelected(BuildContext context, Menu item) {
    final appBloc = context.read<AppBloc>();
    switch (item) {
      case Menu.theme:
        final newThemeMode = appBloc.state.currentThemeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light;
        appBloc.add(ChangeThemeEvent(newThemeMode));
        break;
      case Menu.language:
        final newLocale = appBloc.state.currentLocale == const Locale('en')
            ? const Locale('ar')
            : const Locale('en');
        appBloc.add(ChangeLocaleEvent(newLocale));
        break;
      case Menu.logout:
        // TODO: Handle this case.
        break;
      case Menu.notifications:
        // TODO: Handle this case.
        break;
    }
  }
}
