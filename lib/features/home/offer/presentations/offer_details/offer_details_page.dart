import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';
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
              TalebSliderImagesWidget(
                index: offer.id,
                image: offer.image,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(TalebSizes.h16),
                    DateAndServiceProviderWidget(user: offer.user),
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
