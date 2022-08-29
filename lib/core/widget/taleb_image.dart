import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class TalebImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsets? margin;
  final BoxFit? fit;
  const TalebImageWidget({
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
    this.margin,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderRadius ?? TalebBorderRadius.r12),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: MediaQuery.of(context).size.height,
        color: TalebColors.greyRegular,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
