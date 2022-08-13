import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class NewsImageWidget extends StatelessWidget {
  final String image;
  final double height;
  final double? borderRadius;
  const NewsImageWidget({
    Key? key,
    required this.height,
    required this.image,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
