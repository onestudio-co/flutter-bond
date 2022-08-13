import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class DecorationLabelSimilerWidget extends StatelessWidget {
  const DecorationLabelSimilerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: TalebSizes.w22,
      height: TalebSizes.h22,
      decoration: const BoxDecoration(
        color: TalebColors.blueRegular,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(TalebPadding.p4),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: TalebColors.white,
          ),
          child: Container(),
        ),
      ),
    );
  }
}
