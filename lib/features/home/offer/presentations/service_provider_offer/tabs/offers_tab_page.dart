import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/helpers/logger.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/empty_data_widget.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_list_card_item.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offers_list_item_shimmer.dart';
import 'package:taleb/routes/app_router.dart';

class ServiceProviderOffersOffersTabPage extends StatelessWidget {
  final User user;

  const ServiceProviderOffersOffersTabPage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: TalebPadding.p16),
      child: BlocConsumer<ServiceProviderOfferCubit, ServiceProviderOfferState>(
        listener: (BuildContext context, ServiceProviderOfferState state) {
          state is ServiceProviderOfferLoadFailed
              ? log(state.error, name: 'offer page')
              : null;
        },
        builder: (BuildContext context, ServiceProviderOfferState state) {
          if (state is ServiceProviderOfferLoadSuccess) {
            return GridView.builder(
              itemCount: state.offer.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .6,
              ),
              itemBuilder: (BuildContext context, int index) {
                final Offer offer = state.offer.data[index];
                return OfferListCardItem(
                  onTapCard: () =>
                      context.router.push(OfferDetailsRoute(offer: offer)),
                  onTapServiceProvider: () => context.router.push(
                      ServiceProviderOffersDetailsTabRoute(user: offer.user)),
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
          if (state is ServiceProviderOfferEmpty) {
            return const EmptyDataWidget();
          }
          return const OffersListItemShimmer();
        },
      ),
    );
  }
}
