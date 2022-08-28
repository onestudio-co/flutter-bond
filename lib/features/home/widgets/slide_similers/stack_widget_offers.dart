import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/widgets/additional_info_row_with_city.dart';
import 'package:taleb/routes/app_router.dart';

class SimilerStackOffersWidget extends StatelessWidget {
  const SimilerStackOffersWidget({
    required this.offer,
    Key? key,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(OfferDetailsRoute(offer: offer)),
      child: Padding(
        padding: EdgeInsets.only(left: TalebSizes.w32),
        child: SizedBox(
          width: TalebSizes.w265,
          child: Stack(
            children: [
              TalebImageWidget(
                height: TalebSizes.h200,
                borderRadius: TalebBorderRadius.r20,
                image: offer.image,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(TalebPadding.p12),
                  width: TalebSizes.w232,
                  height: TalebSizes.h111,
                  decoration: BoxDecoration(
                    color: TalebColors.ghostWhite,
                    borderRadius: BorderRadius.circular(TalebBorderRadius.r8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.elephant,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      VerticalSpace(TalebSizes.h8),
                      const Spacer(),
                      RowAdditionalInfoWithCity(
                        hasCity: false,
                        cityName: offer.city.name,
                        user: offer.user,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: TalebSizes.h34,
                  padding: EdgeInsets.symmetric(
                      horizontal: TalebPadding.p16, vertical: TalebPadding.p2),
                  decoration: BoxDecoration(
                    color: TalebColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TalebBorderRadius.r12),
                      bottomRight: Radius.circular(TalebBorderRadius.r20),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: TalebColors.elephantShadow,
                        offset: Offset(4, 6),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Text(
                    '${offer.price} ${offer.currency.name}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.blueExtraDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
