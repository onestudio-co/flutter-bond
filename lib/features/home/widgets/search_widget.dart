import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      height: TalebSizes.h48,
      width: TalebSizes.w48,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              TalebIcons.searchTextField,
              width: 16,
              height: 16,
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.metallicSilver,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TalebColors.softPeach),
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
    );
  }
}
