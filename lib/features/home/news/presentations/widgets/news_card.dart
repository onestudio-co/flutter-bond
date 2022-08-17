import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/routes/app_router.dart';

import '../../../widgets/additional_info_row_with_city.dart';
import 'title_news_card.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    required this.news,
    Key? key,
  }) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(NewsDetailsRoute(news: news)),
      child: Container(
        padding: EdgeInsets.all(TalebPadding.p12),
        margin: EdgeInsets.only(top: TalebPadding.p12),
        decoration: BoxDecoration(
          color: TalebColors.white,
          borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
        ),
        child: Column(
          children: [
            Hero(
              tag: news.id,
              child: TalebImageWidget(
                image: news.image,
                height: TalebSizes.h240,
              ),
            ),
            VerticalSpace(TalebSizes.h8),
            RowAdditionalInfoWithCity(
              hasCity: true,
              user: news.user,
              cityName: news.city.name,
            ),
            VerticalSpace(TalebSizes.h8),
            TitleNewsCard(
              title: news.title,
            ),
          ],
        ),
      ),
    );
  }
}
