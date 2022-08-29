import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/resources/taleb_string.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';
import 'package:taleb/features/home/main/last_offers/cubit/last_offers_cubit.dart';
import 'package:taleb/features/home/main/last_offers/offers_item_slider.dart';
import 'package:taleb/features/home/main/widgets/header_slider.dart';
import 'package:taleb/features/home/offer/data/models/offer.dart';
import 'package:taleb/routes/app_router.dart';

class LastOfferSlider extends StatelessWidget {
  const LastOfferSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastOffersCubit, LastOffersState>(
      builder: (context, state) {
        if (state is LastOffersLoadedSuccess) {
          return Column(
            children: [
              HeaderSlider(
                title: TalebStrings.homeSliderLastOffers,
                onTapSeeMore: () {},
              ),
              SizedBox(
                height: TalebSizes.h378,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.offer.length,
                  itemBuilder: (BuildContext context, int index) {
                    final offer = state.offer[index];
                    return LastOffersItemSlider(
                      offer: offer,
                      onTapCard: () => _goToOfferDetailsPage(context, offer),
                      onTapServiceProvider: () =>
                          _serviceProviderOffersTabBarRoute(context, offer),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is LastOffersLoading) {
          return TalebShimmer(
            child: Container(
              color: Colors.amber,
              height: 200,
              width: 200,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<Object?> _serviceProviderOffersTabBarRoute(
      BuildContext context, Offer offer) {
    return context.router
        .push(ServiceProviderOffersTabBarRoute(user: offer.user));
  }

  Future<Object?> _goToOfferDetailsPage(BuildContext context, Offer offer) =>
      context.router.push(OfferDetailsRoute(offer: offer));
}
