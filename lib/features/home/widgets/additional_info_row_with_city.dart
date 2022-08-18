import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/widgets/searvie_provider_image_and_name.dart';

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
            user: user,
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
                cityName ?? '',
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
