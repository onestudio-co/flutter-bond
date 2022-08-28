import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/widgets/searvie_provider_image_and_name.dart';

class DateAndServiceProviderWidget extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onPress;

  const DateAndServiceProviderWidget({
    required this.name,
    required this.image,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearviceProviderImageAndName(
          padding: TalebPadding.p4,
          radius: TalebSizes.h14,
          height: TalebSizes.h36,
          image: image,
          name: name,
          onPress: onPress,
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
