import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/news/presentations/ui/widgets/news_image.dart';
import 'package:taleb/main.dart';

class NewsAds extends StatelessWidget {
  const NewsAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebSizes.h12),
      child: InkWell(
        onTap: () {},
        child: TalebImageWidget(
          height: TalebSizes.h80,
          image: adsUrl,
        ),
      ),
    );
  }
}
