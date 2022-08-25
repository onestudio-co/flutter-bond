import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';

import '../../../widgets/additional_info_row_with_city.dart';
import 'title_offer_card.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({
    required this.offer,
    Key? key,
  }) : super(key: key);
  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.router.push(OfferDetailsRoute(offer: offer)),
      child: Container(
        decoration: BoxDecoration(
          color: TalebColors.white,
          borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: offer.id,
                    child: TalebImageWidget(
                      image: offer.image,
                      height: TalebSizes.h240,
                    ),
                  ),
                  VerticalSpace(TalebSizes.h8),
                  RowAdditionalInfoWithCity(
                    hasCity: true,
                    user: offer.user,
                    cityName: offer.city.name,
                  ),
                  VerticalSpace(TalebSizes.h8),
                  TitleOfferCard(
                    title: offer.title,
                  ),
                ],
              ),
            ),
            VerticalSpace(TalebSizes.h16),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h16),
          ],
        ),
      ),
    );
  }
}
