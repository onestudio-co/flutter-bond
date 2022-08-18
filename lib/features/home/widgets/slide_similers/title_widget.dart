import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

import 'decoration_labal_widget.dart';

class SimilerLabelWidget extends StatelessWidget {
  const SimilerLabelWidget({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecorationLabelSimilerWidget(),
        HorizontalSpace(TalebSizes.w8),
        Text(
          title ?? 'أخبار مماثلة',
          style: Theme.of(context).textTheme.titleMedium?.elephant,
        )
      ],
    );
  }
}
