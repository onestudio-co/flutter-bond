import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.hintText,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h47,
      child: TextField(
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.labelSmall?.elephant,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding:
                EdgeInsets.only(left: TalebSizes.w8, right: TalebSizes.w16),
            child: SvgPicture.asset(
              TalebIcons.searchTextField,
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.metallicSilver,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TalebColors.softPeach),
            borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TalebColors.blueRegular),
            borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
          ),
          fillColor: TalebColors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: TalebColors.white),
            borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
          ),
        ),
      ),
    );
  }
}