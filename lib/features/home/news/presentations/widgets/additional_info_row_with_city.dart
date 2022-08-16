import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/news/data/models/news.dart';

import '../searvice_provider_news/searvice_provider.dart';

class RowAdditionalInfoWithCity extends StatelessWidget {
  const RowAdditionalInfoWithCity({
    required this.hasCity,
    required this.news,
    Key? key,
  }) : super(key: key);

  final bool hasCity;
  final News news;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h24,
      child: Row(
        children: [
          SearviceProviderLabel(
            padding: TalebPadding.p2,
            news: news,
          ),
          if (hasCity) const SizedBox(width: 4),
          if (hasCity)
            Container(
              height: 24,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff37b0cc),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Text(
                news.city.name,
                style: Theme.of(context).textTheme.titleSmall!.white,
              ),
            ),
          const Spacer(),
          Text(
            '2 أغسطس 2022',
            style: Theme.of(context).textTheme.displaySmall!.coolGrey,
          ),
        ],
      ),
    );
  }
}

class SearviceProviderLabel extends StatelessWidget {
  final double padding;
  final double? radius;
  final News? news;

  const SearviceProviderLabel({
    required this.padding,
     this.news,
    Key? key,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushWidget(const SearviceProviderNewsPage()),
      child: Container(
        padding: EdgeInsets.only(
          right: padding,
          left: TalebPadding.p8,
          top: padding,
          bottom: padding,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff37b0cc),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: radius ?? 10,
              backgroundImage: NetworkImage(
                news!.image,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              news!.user.name,
              style: Theme.of(context).textTheme.titleSmall!.white,
            ),
          ],
        ),
      ),
    );
  }
}
