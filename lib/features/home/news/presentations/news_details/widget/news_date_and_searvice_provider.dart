import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/widgets/searvie_provider_image_and_name.dart';

class DateAndSearviceProviderWidget extends StatelessWidget {
  const DateAndSearviceProviderWidget({
    this.user,
    Key? key,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearviceProviderImageAndName(
          padding: TalebPadding.p4,
          radius: 14,
          user: user,
        ),
        Text(
          '2 أغسطس 2022',
          style: Theme.of(context).textTheme.displayLarge!.spanishGray,
        ),
      ],
    );
  }
}
