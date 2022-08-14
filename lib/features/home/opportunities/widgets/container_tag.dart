import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class ContainerTagWidget extends StatelessWidget {
  const ContainerTagWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: TalebSizes.w7,
        vertical: TalebSizes.w2,
      ),
      decoration: BoxDecoration(
          color: TalebColors.custome3,
          borderRadius: BorderRadius.circular(TalebBorderRadius.r32)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.white,
      ),
    );
  }
}
