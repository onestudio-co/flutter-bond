import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/features/home/widgets/slide_similers/main_widget_offers.dart';
import 'package:taleb/features/home/widgets/taleb_app_bar.dart';

import 'cubit/similar_offers_cubit.dart';
import 'widget/offer_date_and_service_provider.dart';

class OfferDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  const OfferDetailsPage({
    required this.offer,
    Key? key,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SimilarOffersCubit>(
      create: (BuildContext context) =>
          sl<SimilarOffersCubit>()..similarOffer(offer.id),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TalebAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.call),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: TalebSizes.h12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TalebDivider2(thickness: 2),
              VerticalSpace(TalebSizes.h16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: TalebSizes.h300,
                      child: Stack(
                        children: [
                          TalebSliderImagesWidget(
                            index: offer.id,
                            image: offer.image,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: TalebPadding.defaultPadding),
                              padding: EdgeInsets.symmetric(
                                horizontal: TalebPadding.p16,
                              ),
                              decoration: BoxDecoration(
                                color: TalebColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      TalebPadding.defaultPadding),
                                  bottomRight: Radius.circular(
                                      TalebPadding.defaultPadding),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: TalebColors.elephantShadow,
                                    offset: Offset(4, 8),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: TalebSizes.h34,
                                child: Text(
                                  '${offer.price} ${offer.currency.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.blueExtraDark,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    VerticalSpace(TalebSizes.h16),
                    DateAndServiceProviderWidget(
                      name: offer.user.name,
                      image: offer.user.image,
                      onPress: () {
                        logger.i('This is offers Details Page');
                      },
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Text(
                      offer.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.elephant,
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Padding(
                      padding: EdgeInsets.only(bottom: TalebPadding.p32),
                      child: Text(
                        offer.content,
                        style:
                            Theme.of(context).textTheme.displayLarge!.elephant,
                      ),
                    ),
                    const TalebDivider2(),
                    const SimilarMainOffersWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
