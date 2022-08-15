import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/news/ui/widgets/news_image.dart';
import 'package:taleb/main.dart';

class TalebSliderImagesWidget extends StatelessWidget {
  const TalebSliderImagesWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: ImageSlideshow(
        height: TalebSizes.h290,
        initialPage: 0,
        indicatorColor: TalebColors.blueRegular,
        indicatorBackgroundColor: TalebColors.greyRegular,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          TalebImageWidget(
            image: url,
            margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
            height: TalebSizes.h290,
          ),
          TalebImageWidget(
            image: url,
            margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
            height: TalebSizes.h290,
          ),
          TalebImageWidget(
            image: url,
            margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
            height: TalebSizes.h290,
          ),
        ],
      ),
    );
  }
}
