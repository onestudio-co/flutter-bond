import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: TalebSizes.h48,
        width: TalebSizes.w48,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                TalebIcons.searchTextField,
                width: 16,
                height: 16,
              ),
            ),
            hintText: 'ابحث في الأخبار',
            hintStyle: Theme.of(context).textTheme.bodyLarge!.metallicSilver,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: TalebColors.white),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: TalebColors.blueRegular),
              borderRadius: BorderRadius.circular(12.0),
            ),
            fillColor: TalebColors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: TalebColors.white),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
