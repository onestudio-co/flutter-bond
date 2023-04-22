import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/features/update_app/update_app_service.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_core/core.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    sl<UpdateAppService>().showSoftUpdate();
  }

  @override
  Widget build(BuildContext context) {

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MoreRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: context.localizations.navigation_bar_home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.collections),
                label: context.localizations.navigation_bar_collections,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_horiz),
                label: context.localizations.navigation_bar_more,
              ),
            ],
          ),
        );
      },
    );
  }
}
