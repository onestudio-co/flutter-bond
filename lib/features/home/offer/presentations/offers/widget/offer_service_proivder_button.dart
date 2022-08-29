import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';

class OfferServiceProivderButton extends StatelessWidget {
  final String name;
  final String urlImage;
  final double? width;
  final VoidCallback onTap;

  const OfferServiceProivderButton({
    required this.name,
    required this.urlImage,
    required this.onTap,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: TalebSizes.h36,
      width: width,
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
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(TalebPadding.p8),
          child: Row(
            children: [
              TalebAvatarImage(
                width: TalebSizes.h20,
                height: TalebSizes.w20,
                urlImage: urlImage,
                borderColor: TalebColors.softPeach,
              ),
              HorizontalSpace(TalebSizes.w4),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall?.chathamsBlue,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
