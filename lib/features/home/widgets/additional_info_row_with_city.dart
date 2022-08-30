import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/widgets/searvie_provider_image_and_name.dart';
import 'package:taleb/routes/app_router.dart';

class RowAdditionalInfoWithCity extends StatelessWidget {
  const RowAdditionalInfoWithCity({
    required this.hasCity,
    required this.cityName,
    required this.user,
    Key? key,
  }) : super(key: key);

  final bool hasCity;
  final User user;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TalebSizes.h24,
      child: Row(
        children: [
          SearviceProviderImageAndName(
            padding: TalebPadding.p2,
            image: user.image,
            name: user.name,
            onPress: () => context.router
                .push(SearviceProviderNewsRoute(searviceProviderId: user.id)),
          ),
          if (hasCity) HorizontalSpace(TalebSizes.w4),
          if (hasCity)
            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: TalebPadding.p8,
                vertical: TalebPadding.p2,
              ),
              decoration: BoxDecoration(
                color: TalebColors.softPeach,
                borderRadius: BorderRadius.circular(TalebBorderRadius.r32),
              ),
              child: Text(
                cityName ?? '',
                style: Theme.of(context).textTheme.titleSmall?.elephant,
                textAlign: TextAlign.center,
              ),
            ),
          const Spacer(),
          Text(
            '2 أغسطس 2022',
            style: Theme.of(context).textTheme.displaySmall?.coolGrey,
          ),
        ],
      ),
    );
  }
}
