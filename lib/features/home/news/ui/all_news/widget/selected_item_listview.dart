import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';

class ItemListViewWidget extends StatelessWidget {
  const ItemListViewWidget({
    required this.name,
    required int selectedIndex,
    required this.index,
    this.logo,
    Key? key,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final String name;
  final String? logo;
  final int _selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: logo == null
              ? EdgeInsets.symmetric(vertical: TalebPadding.p12)
              : EdgeInsets.symmetric(vertical: TalebPadding.p8),
          child: Row(
            children: [
              if (logo != null)
                Row(
                  children: [
                    CircleAvatar(
                      radius: TalebBorderRadius.r16,
                      backgroundImage: NetworkImage(logo!),
                    ),
                    HorizontalSpace(TalebSizes.w8),
                  ],
                ),
              Text(
                name,
                style: _selectedIndex == index
                    ? Theme.of(context).textTheme.labelMedium?.blueDark
                    : Theme.of(context).textTheme.labelMedium?.elephant,
              ),
              const Spacer(),
              if (_selectedIndex == index) SvgPicture.asset(TalebIcons.share)
            ],
          ),
        ),
      ],
    );
  }
}
