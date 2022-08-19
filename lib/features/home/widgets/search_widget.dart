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
      height: TalebSizes.h48,
      child: TextField(
        onChanged: onChanged,
        // cursorHeight: TalebSizes.h15,
        textAlignVertical: TextAlignVertical.top,
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

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  final void Function(String p1)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorHeight: TalebSizes.h15,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: TalebSizes.w8, right: TalebSizes.w16),
          child: SvgPicture.asset(
            TalebIcons.searchTextField,
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
    );
  }
}
