import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class TalebContainer extends StatelessWidget {
  const TalebContainer({
    required this.child,
    Key? key,
    this.backgroundColor = TalebColors.white,
    this.padding,
    this.margin,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.circular(TalebBorderRadius.r16),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
