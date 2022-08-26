import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';

class HomeBottomNavBarItem extends BottomNavigationBarItem {
  final String title;
  final String image;

  HomeBottomNavBarItem({required this.title, required this.image})
      : super(
          label: title,
          icon: SvgPicture.asset(
            image,
            color: TalebColors.paleAqua,
          ),
          activeIcon: SvgPicture.asset(
            image,
            color: TalebColors.blueRegular,
          ),
        );
}
