import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';

class TalebAvatarImage extends StatelessWidget {
  final double width;
  final double height;
  final String urlImage;
  final Color borderColor;

  const TalebAvatarImage({
    required this.width,
    required this.height,
    required this.urlImage,
    this.borderColor = TalebColors.softPeach,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: borderColor,
          width: TalebSizes.w1,
        ),
      ),
    );
  }
}
