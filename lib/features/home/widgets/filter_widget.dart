import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: TalebSizes.h48,
        width: TalebSizes.w48,
        padding: EdgeInsets.all(TalebPadding.p12),
        decoration: BoxDecoration(
            color: TalebColors.blueRegular,
            borderRadius: BorderRadius.circular(TalebBorderRadius.r12)),
        child: SvgPicture.asset(
          TalebIcons.filter,
          color: TalebColors.white,
        ),
      ),
    );
  }
}
