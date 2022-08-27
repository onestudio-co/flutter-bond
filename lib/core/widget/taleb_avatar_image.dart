import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class TalebAvatarImage extends StatelessWidget {
  final double width;
  final double height;
  final String urlImage;
  final Color borderColor;

  const TalebAvatarImage({
    required this.width,
    required this.height,
    required this.urlImage,
    required this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
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
