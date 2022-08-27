import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_list_card_item.dart';
import 'package:taleb/main.dart';

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
          return GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (BuildContext context, int count) {
              return OfferListCardItem(
                urlImage: url,
                title:
                    'تعلن أكاديمية الأثير عن انطلاق شعبنا الجديدة💪💜  لمادة الفيزياء',
                price: '50',
                currancy: 'دينار أردني',
                serviceProvidarName: 'أكاديمية الأثير',
                serviceProvidarImage: url,
              );
            },
          );
        },
      ),
    );
  }
}
