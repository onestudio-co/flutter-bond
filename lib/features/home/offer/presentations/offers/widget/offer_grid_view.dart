import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_list_card_item.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offers_list_item_shimmer.dart';
import 'package:taleb/routes/app_router.dart';

class OffersGridView extends StatelessWidget {
  const OffersGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<OffersCubit, OffersState>(
        listener: (BuildContext context, OffersState state) {
          state is OffersLoadFailed
              ? log(state.error, name: 'offer page')
              : null;
        },
        builder: (BuildContext context, OffersState state) {
          if (state is OffersLoadSuccess) {
            return GridView.builder(
              itemCount: state.offer.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                final Offer offer = state.offer.data[index];
                return OfferListCardItem(
                  onTapCard: () =>
                      context.router.push(OfferDetailsRoute(offer: offer)),
                  onTapServiceProvider: () {
                    // final router = context.innerRouterOf<TabsRouter>(
                    //     ServiceProviderOffersTabBarRoute.name);
                    // router?.navigate(
                    //     ServiceProviderOffersDetailsTabRoute(user: offer.user));
                  },
                  urlImage: offer.image,
                  title: offer.title,
                  price: offer.price.toString(),
                  currancy: offer.currency.name,
                  serviceProvidarName: offer.user.name,
                  serviceProvidarImage: offer.user.image,
                );
              },
            );
          }
          if (state is OffersLoadFailed) {
            logger.e(state.error);
          }
          return const OffersListItemShimmer();
        },
      ),
    );
  }
}
