import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/circular_progress_indecator.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';

import 'stack_widget_offers.dart';
import 'title_widget.dart';

class SimilarMainOffersWidget extends StatelessWidget {
  const SimilarMainOffersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarOffersCubit, SimilarOffersState>(
      builder: (BuildContext context, SimilarOffersState state) {
        if (state is SimilarOffersLoadedSuccess) {
          return Container(
            height: TalebSizes.h370,
            width: MediaQuery.of(context).size.width,
            color: TalebColors.white,
            padding: EdgeInsets.symmetric(
              vertical: TalebPadding.p32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SimilerLabelWidget(),
                VerticalSpace(TalebSizes.h16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.offer.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return SimilerStackOffersWidget(
                          offer: state.offer[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is SimilarOfferLoadFailure) {
          return const Center(child: Text('حدث خطأ ما .........'));
        } else {
          return const TalebCircularProgressIndicator();
        }
      },
    );
  }
}
