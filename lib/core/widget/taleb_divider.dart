import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class TalebDivider extends StatelessWidget {
  final double height;
  final Color color;
  const TalebDivider({
    Key? key,
    this.height = 16,
    this.color = TalebColors.ghostWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      thickness: 4,
    );
  }
}
