import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import 'additional_info_row.dart';

class NewsDateAndSearviceProviderWidget extends StatelessWidget {
  const NewsDateAndSearviceProviderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearviceProviderLabel(
          padding: TalebPadding.p4,
          radius: 14,
        ),
        Text(
          '2 أغسطس 2022',
          style: Theme.of(context).textTheme.displayLarge!.spanishGray,
        ),
      ],
    );
  }
}
