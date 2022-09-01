import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/import_resources.dart';

class LabelSelectedFilterInSearch extends StatelessWidget {
  final String filterName;
  final VoidCallback onCancel;

  const LabelSelectedFilterInSearch({
    required this.filterName,
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TalebPadding.p4),
      decoration: BoxDecoration(
        color: TalebColors.softPeach,
        borderRadius: BorderRadius.circular(TalebBorderRadius.r4),
      ),
      child: Row(
        children: [
          Text(
            filterName,
            style: Theme.of(context).textTheme.titleSmall?.elephant,
          ),
          HorizontalSpace(TalebSizes.w4),
          InkWell(
            onTap: onCancel,
            child: SvgPicture.asset(TalebIcons.cancel),
          )
        ],
      ),
    );
  }
}
