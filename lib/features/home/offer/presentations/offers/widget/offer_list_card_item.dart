import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_service_proivder_button.dart';

class OfferListCardItem extends StatelessWidget {
  final String urlImage;
  final String title;
  final String price;
  final String currancy;
  final String serviceProvidarName;
  final String serviceProvidarImage;
  final VoidCallback onTap;

  const OfferListCardItem({
    required this.urlImage,
    required this.title,
    required this.price,
    required this.currancy,
    required this.serviceProvidarName,
    required this.serviceProvidarImage,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: GridTile(
        child: Container(
          height: TalebSizes.h315,
          decoration: BoxDecoration(
            border: Border.all(
              color: TalebColors.softPeach,
              width: 0.5,
            ),
          ),
          padding: EdgeInsets.all(TalebPadding.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TalebImageWidget(
                image: urlImage,
                height: TalebSizes.h107,
              ),
              VerticalSpace(TalebSizes.h8),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.chathamsBlue,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                '$price $currancy',
                style: Theme.of(context).textTheme.bodyMedium?.blueRegular,
              ),
              VerticalSpace(TalebSizes.h12),
              OfferServiceProivderButton(
                name: serviceProvidarName,
                urlImage: serviceProvidarImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}