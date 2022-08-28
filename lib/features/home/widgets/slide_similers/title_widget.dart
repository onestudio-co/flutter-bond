import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

import 'decoration_labal_widget.dart';

class SimilerLabelWidget extends StatelessWidget {
  final String title;

  const SimilerLabelWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecorationLabelSimilerWidget(),
        HorizontalSpace(TalebSizes.w8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.elephant,
        )
      ],
    );
  }
}
