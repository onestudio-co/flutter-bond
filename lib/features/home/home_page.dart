import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_fonts.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/resources/taleb_styles.dart';
import 'package:taleb/features/home/news/presentations/all_news/news_page.dart';

import 'opportunities/ui/all_opportunities/all_opportunities_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: currentPage(),
      bottomNavigationBar: Container(
        height: TalebSizes.h90,
        decoration: const BoxDecoration(
          color: TalebColors.white,
        ),
        child: BottomNavigationBar(
          backgroundColor: TalebColors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: TalebColors.blueRegular,
          unselectedItemColor: TalebColors.paleAqua,
          showUnselectedLabels: true,
          unselectedLabelStyle: getBoldStyle(
              fontSize: TalebFontSize.s10, color: TalebColors.paleAqua),
          selectedLabelStyle: getBoldStyle(
              fontSize: TalebFontSize.s10, color: TalebColors.blueDark),
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            //* Home Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p4),
                child: SvgPicture.asset(
                  TalebIcons.homeNavBar,
                  width: TalebSizes.w20,
                  height: TalebSizes.h20,
                  color: selectedSvgIconColor(_selectedIndex == 0),
                ),
              ),
              label: 'الرئيسية',
            ),
            //* Sooq Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p4),
                child: SvgPicture.asset(
                  TalebIcons.sooqNavBar,
                  color: selectedSvgIconColor(_selectedIndex == 1),
                ),
              ),
              label: 'السوق',
            ),
            //* News Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p4),
                child: SvgPicture.asset(
                  TalebIcons.newsNavBar,
                  color: selectedSvgIconColor(_selectedIndex == 2),
                ),
              ),
              label: 'الأخبار',
            ),
            //* opportunity Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p4),
                child: SvgPicture.asset(
                  TalebIcons.opportunityNavBar,
                  color: selectedSvgIconColor(_selectedIndex == 3),
                ),
              ),
              label: 'الفرص',
            ),
            //* More Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p4),
                child: SvgPicture.asset(
                  TalebIcons.moreNavBar,
                  color: selectedSvgIconColor(_selectedIndex == 4),
                ),
              ),
              label: 'المزيد',
            ),
          ],
        ),
      ),
    );
  }

  Widget currentPage() {
    return <Widget>[
      const Text('2'),
      const Text('3'),
      const NewsPage(),
      const OpportunitiesPage(),
      const Text('3'),
    ][_selectedIndex];
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Color selectedSvgIconColor(bool isSelected) =>
      isSelected ? TalebColors.blueRegular : TalebColors.paleAqua;
}
