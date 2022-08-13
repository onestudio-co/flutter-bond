import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import '../searvice_provider_news/searvice_provider.dart';

class RowAdditionalInfoWithCity extends StatelessWidget {
  final bool hasCity;
  const RowAdditionalInfoWithCity({
    Key? key,
    required this.hasCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h24,
      child: Row(
        children: [
          SearviceProviderLabel(
            padding: TalebPadding.p2,
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
                'عمان',
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
  const SearviceProviderLabel({
    Key? key,
    required this.padding,
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
              backgroundImage: const NetworkImage(
                'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'وزارة الشباب',
              style: Theme.of(context).textTheme.titleSmall!.white,
            ),
          ],
        ),
      ),
    );
  }
}
