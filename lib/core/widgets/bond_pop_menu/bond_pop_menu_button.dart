import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/features/app/app_bloc.dart';
import 'package:bond/features/auth/auth.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';

import 'bond_popup_menu_item.dart';

class BondPopMenuButton extends StatelessWidget {
  const BondPopMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      onSelected: (Menu item) => _onSelected(context, item),
      icon: const Icon(
        Icons.more_vert_rounded,
        color: Colors.white,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        BondPopupBondMenuItem(
          value: Menu.theme,
          icon: Icon(
            Icons.color_lens_rounded,
            color: context.colorScheme.onBackground,
          ),
          title: context.localizations.popup_menu_theme,
        ),
        BondPopupBondMenuItem(
          value: Menu.language,
          icon: Icon(
            Icons.language,
            color: context.colorScheme.onBackground,
          ),
          title: context.localizations.popup_menu_language_title,
        ),
        BondPopupBondMenuItem(
          value: Menu.notifications,
          icon: Icon(
            Icons.notifications_rounded,
            color: context.colorScheme.onBackground,
          ),
          title: context.localizations.popup_menu_notification_center,
        ),
        if (Auth.check())
          BondPopupBondMenuItem(
            value: Menu.logout,
            icon: Icon(
              Icons.logout,
              color: context.colorScheme.onBackground,
            ),
            title: context.localizations.popup_menu_logout,
          ),
      ],
    );
  }

  void _onSelected(BuildContext context, Menu item) {
    final appBloc = context.read<AppBloc>();
    final logoutCubit = context.read<LogoutCubit?>();
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
        logoutCubit?.logout();
        break;
      case Menu.notifications:
        context.router.push(
          NotificationsRoute(
            notificationCenterProvider: sl<NotificationCenterProvider>(),
          ),
        );
        break;
    }
  }
}
