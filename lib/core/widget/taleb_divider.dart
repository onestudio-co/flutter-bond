import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class TalebDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double? thickness;
  const TalebDivider({
    Key? key,
    this.height = 16,
    this.color = TalebColors.ghostWhite,
    this.thickness = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      thickness: thickness,
    );
  }
}

class TalebDivider2 extends StatelessWidget {
  final double height;
  final Color color;
  final double? thickness;
  const TalebDivider2({
    Key? key,
    this.height = 0,
    this.color = TalebColors.softPeach,
    this.thickness = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
      thickness: thickness,
    );
  }
}
