import 'package:flutter/material.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';

class OfferServiceProivderButton extends StatelessWidget {
  final String name;
  final String urlImage;
  final VoidCallback onTap;
  const OfferServiceProivderButton({
    required this.name,
    required this.urlImage,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(TalebPadding.p8),
        height: TalebSizes.h36,
        decoration: BoxDecoration(
          color: TalebColors.white,
          borderRadius: BorderRadius.circular(
            TalebBorderRadius.r8,
          ),
          border: Border.all(
            width: TalebSizes.w1,
            color: TalebColors.softPeach,
          ),
        ),
        child: Row(
          children: [
            TalebAvatarImage(
              width: TalebSizes.h20,
              height: TalebSizes.w20,
              urlImage: urlImage,
              borderColor: TalebColors.softPeach,
            ),
            HorizontalSpace(TalebSizes.w4),
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall?.chathamsBlue,
            ),
          ],
        ),
      ),
    );
  }
}
