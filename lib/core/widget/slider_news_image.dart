import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';

class TalebSliderImagesWidget extends StatelessWidget {
  const TalebSliderImagesWidget({
    required this.images,
    required this.index,
    this.height,
    this.padding,
    Key? key,
    this.indicatorColor = TalebColors.blueRegular,
    this.indicatorBackgroundColor = TalebColors.white,
  }) : super(key: key);

  final List<String> images;
  final int index;
  final EdgeInsets? padding;
  final double? height;
  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: Container(
        padding: padding,
        child: ImageSlideshow(
          height: height ?? TalebSizes.h285,
          initialPage: 0,
          indicatorColor: indicatorColor,
          indicatorBackgroundColor: indicatorBackgroundColor,
          autoPlayInterval: 3000,
          isLoop: false,
          children: images.map((image) {
            return TalebImageWidget(
              image: image,
              margin: EdgeInsets.symmetric(horizontal: TalebSizes.w8),
            );
          }).toList(),
        ),
      ),
    );
  }
}
