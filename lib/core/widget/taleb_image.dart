import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class TalebImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? margin;
  const TalebImageWidget({
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
    this.margin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(borderRadius ?? TalebBorderRadius.r12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            image,
          ),
        ),
      ),
      child: SizedBox(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
      ),
    );
  }
}
