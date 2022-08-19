import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';

class TalebSliderImagesWidget extends StatelessWidget {
  const TalebSliderImagesWidget({
    required this.image,
    required this.index,
    Key? key,
  }) : super(key: key);

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: ImageSlideshow(
        height: TalebSizes.h290,
        initialPage: 0,
        indicatorColor: Colors.transparent,
        indicatorBackgroundColor: TalebColors.greyRegular,
        autoPlayInterval: 3000,
        isLoop: false,
        children: [
          TalebImageWidget(
            image: image,
            margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
            height: TalebSizes.h290,
          ),
          // TalebImageWidget(
          //   image: url,
          //   margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
          //   height: TalebSizes.h290,
          // ),
          // TalebImageWidget(
          //   image: url,
          //   margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
          //   height: TalebSizes.h290,
          // ),
        ],
      ),
    );
  }
}
