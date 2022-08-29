import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_service_proivder_button.dart';

class LastOffersItemSlider extends StatelessWidget {
  final VoidCallback onTapCard;
  final VoidCallback onTapServiceProvider;
  final Offer offer;

  const LastOffersItemSlider({
    required this.onTapCard,
    required this.onTapServiceProvider,
    required this.offer,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
        height: TalebSizes.h315,
        width: TalebSizes.h282,
        padding: EdgeInsets.all(TalebPadding.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TalebImageWidget(
              image: offer.image,
              height: TalebSizes.h192,
            ),
            VerticalSpace(TalebSizes.h8),
            Text(
              offer.title,
              style: Theme.of(context).textTheme.labelSmall?.chathamsBlue,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              '${offer.price} ${offer.currency.name}',
              style: Theme.of(context).textTheme.bodyMedium?.blueRegular,
            ),
            VerticalSpace(TalebSizes.h12),
            OfferServiceProivderButton(
              name: offer.user.name,
              urlImage: offer.user.image,
              onTap: onTapServiceProvider,
              width: TalebSizes.w162,
            ),
          ],
        ),
      ),
    );
  }
}
