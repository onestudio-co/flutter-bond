import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

import 'decoration_labal_widget.dart';

class SimilerTitleWidget extends StatelessWidget {
  const SimilerTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecorationLabelSimilerWidget(),
        HorizontalSpace(TalebSizes.w8),
        Text(
          'أخبار مماثلة',
          style: Theme.of(context).textTheme.titleMedium?.elephant,
        )
      ],
    );
  }
}
