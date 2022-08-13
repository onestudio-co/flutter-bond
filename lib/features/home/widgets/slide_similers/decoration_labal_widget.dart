import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class DecorationLabelSimilerWidget extends StatelessWidget {
  const DecorationLabelSimilerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: TalebBorderRadius.r12,
      backgroundColor: TalebColors.white,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TalebColors.blueRegular,
            width: TalebSizes.w4,
          ),
        ),
      ),
    );
  }
}
