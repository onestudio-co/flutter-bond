import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';

class TalebSliderImagesWidget extends StatelessWidget {
  final List<String> images;
  final int? index;
  final EdgeInsets? padding;
  final double? height;
  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;
  final VoidCallback? onTap;

  const TalebSliderImagesWidget({
    required this.images,
    this.index,
    this.height,
    this.padding,
    Key? key,
    this.indicatorColor = TalebColors.blueRegular,
    this.indicatorBackgroundColor = TalebColors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ImageSlideshow(
        height: height ?? TalebSizes.h285,
        initialPage: 0,
        indicatorColor: indicatorColor,
        indicatorBackgroundColor: indicatorBackgroundColor,
        autoPlayInterval: 5000,
        isLoop: true,
        children: images.map((image) {
          return GestureDetector(
            onTap: onTap,
            child: TalebImageWidget(
              image: image,
              margin: EdgeInsets.symmetric(horizontal: TalebSizes.w8),
            ),
          );
        }).toList(),
      ),
    );
  }
}
