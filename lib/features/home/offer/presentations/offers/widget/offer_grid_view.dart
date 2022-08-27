import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_list_card_item.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offers_list_item_shimmer.dart';

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
                childAspectRatio: .85,
              ),
              itemBuilder: (BuildContext context, int index) {
                final Offer offer = state.offer.data[index];
                return OfferListCardItem(
                  onTap: () =>
                      context.read<OffersCubit>().loadOffers(emitLoading: true),
                  urlImage: offer.image,
                  title: offer.title,
                  price: offer.price.toString(),
                  currancy: offer.currency.name,
                  serviceProvidarName: offer.user.name,
                  serviceProvidarImage: offer.user.image,
                );
              },
            );
          } else {
            return const OffersListItemShimmer();
          }
        },
      ),
    );
  }
}
