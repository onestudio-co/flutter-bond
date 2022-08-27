import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/routes/app_router.dart';

import 'home_bottom_nav_bar_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        OffersRoute(),
        NewsRoute(),
        OpportunitiesRoute(),
      ],
      builder:
          (BuildContext context, Widget child, Animation<double> animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) => tabsRouter.setActiveIndex(index),
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: TalebColors.white,
            selectedItemColor: TalebColors.blueRegular,
            unselectedItemColor: TalebColors.paleAqua,
            showUnselectedLabels: true,
            unselectedLabelStyle: getBoldStyle(
                fontSize: TalebFontSize.s10, color: TalebColors.paleAqua),
            selectedLabelStyle: getBoldStyle(
                fontSize: TalebFontSize.s10, color: TalebColors.blueDark),
            items: [
              HomeBottomNavBarItem(
                title: TalebStrings.bottomNavBarSooq,
                image: TalebIcons.newsNavBar,
              ),
              HomeBottomNavBarItem(
                title: TalebStrings.bottomNavBarNews,
                image: TalebIcons.newsNavBar,
              ),
              HomeBottomNavBarItem(
                title: TalebStrings.bottomNavBarOpportunities,
                image: TalebIcons.opportunityNavBar,
              ),
            ],
          ),
        );
      },
    );
  }
}
