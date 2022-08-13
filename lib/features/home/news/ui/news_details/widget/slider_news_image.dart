import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/news/ui/widgets/news_image.dart';
import 'package:taleb/main.dart';

class SliderNews extends StatelessWidget {
  const SliderNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      height: TalebSizes.h290,
      initialPage: 0,
      indicatorColor: TalebColors.blueRegular,
      indicatorBackgroundColor: TalebColors.greyRegular,
      children: [
        NewsImageWidget(
          image: url,
          margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
          height: TalebSizes.h290,
        ),
        NewsImageWidget(
          image: url,
          margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
          height: TalebSizes.h290,
        ),
        NewsImageWidget(
          image: url,
          margin: EdgeInsets.symmetric(horizontal: TalebSizes.w16),
          height: TalebSizes.h290,
        ),
      ],
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }
}
