import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleb/core/helpers/url_launcher.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/features/ad/presentations/paid_ad_cubit/paid_ad_cubit.dart';

import 'paid_ads_shimmer.dart';

class PaidAdsSlider extends StatelessWidget {
  const PaidAdsSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaidAdCubit, PaidAdState>(
      builder: (context, state) {
        if (state is PaidAdLoadedSuccess) {
          return TalebSliderImagesWidget(
            padding: EdgeInsets.symmetric(horizontal: TalebPadding.p8),
            images: state.ads.map((images) => images.image).toList(),
            height: TalebSizes.h257,
            onTap: () => UrlLauncher.lauchUrl(
                Url(scheme: 'https', host: 'www.google.com')),
          );
        } else if (state is PaidAdLoading) {
          return GestureDetector(
            onTap: () => UrlLauncher.lauchUrl(
                Url(scheme: 'https', host: 'www.google.com')),
            child: const PaidAdsShimmer(),
          );
        } else {
          return const PaidAdsShimmer();
        }
      },
    );
  }
}
