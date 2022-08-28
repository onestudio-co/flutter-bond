import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class SearviceProviderImageAndName extends StatelessWidget {
  final double padding;
  final double? radius;
  final double? height;
  final TextStyle? textStyle;
  final VoidCallback onPress;
  final String image;
  final String name;

  const SearviceProviderImageAndName({
    required this.onPress,
    required this.image,
    required this.name,
    required this.padding,
    Key? key,
    this.radius,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height ?? TalebSizes.h24,
        decoration: BoxDecoration(
          color: TalebColors.blueDark,
          borderRadius:
              BorderRadius.all(Radius.circular(TalebBorderRadius.r32)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: padding,
                top: padding,
                bottom: padding,
              ),
              child: CircleAvatar(
                radius: radius ?? TalebSizes.h10,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
            ),
            HorizontalSpace(TalebSizes.w4),
            Padding(
              padding: EdgeInsets.only(
                bottom: TalebPadding.p2,
              ),
              child: Text(
                name,
                style:
                    textStyle ?? Theme.of(context).textTheme.titleSmall!.white,
              ),
            ),
            HorizontalSpace(TalebSizes.w8),
          ],
        ),
      ),
    );
  }
}
