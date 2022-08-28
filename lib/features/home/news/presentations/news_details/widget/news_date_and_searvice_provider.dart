import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/widgets/searvie_provider_image_and_name.dart';
import 'package:taleb/routes/app_router.dart';

class DateAndSearviceProviderWidget extends StatelessWidget {
  const DateAndSearviceProviderWidget({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearviceProviderImageAndName(
          padding: TalebPadding.p4,
          radius: TalebSizes.h14,
          height: TalebSizes.h36,
          image: user.image,
          name: user.name,
          onPress: () => context.router
              .push(SearviceProviderNewsRoute(searviceProviderId: user.id)),
          textStyle: Theme.of(context).textTheme.displayLarge?.white,
        ),
        Text(
          '2 أغسطس 2022',
          style: Theme.of(context).textTheme.displayLarge!.spanishGray,
        ),
      ],
    );
  }
}
