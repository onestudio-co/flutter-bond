import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';


class ServiceProviderSocialInfoRow extends StatelessWidget {
  final String socialInfo;
  final String icon;
  final VoidCallback onTap;

  const ServiceProviderSocialInfoRow({
    required this.socialInfo,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(TalebPadding.p8),
            width: TalebSizes.w30,
            height: TalebSizes.h30,
            decoration: const BoxDecoration(
              color: TalebColors.blueRegular,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              color: TalebColors.white,
            ),
          ),
          HorizontalSpace(TalebSizes.w8),
          Text(
            socialInfo,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.titleMedium?.elephant,
          ),
        ],
      ),
    );
  }
}
