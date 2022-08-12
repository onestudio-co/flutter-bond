import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import '../pages/searvice_provider.dart';

class RowAdditionalInfo extends StatelessWidget {
  const RowAdditionalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h24,
      child: Row(
        children: [
          Text(
            '2 أغسطس 2022',
            style: Theme.of(context).textTheme.displaySmall!.coolGrey,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () =>
                context.router.pushWidget(const SearviceProviderNewsPage()),
            child: Container(
              padding: EdgeInsets.only(
                right: TalebPadding.p2,
                left: TalebPadding.p8,
                top: TalebPadding.p2,
                bottom: TalebPadding.p2,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff37b0cc),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
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
          ),
          const SizedBox(width: 4),
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
        ],
      ),
    );
  }
}
