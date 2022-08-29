import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/main/last_offers/cubit/last_offers_cubit.dart';
import 'package:taleb/features/home/main/last_offers/offers_slider.dart';
import 'package:taleb/main.dart';

class MainPage extends StatelessWidget implements AutoRouteWrapper {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LastOffersCubit>(
            create: (BuildContext context) =>
                sl<LastOffersCubit>()..lastOffers(),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          TalebIcons.talebLogo,
          height: TalebSizes.h40,
          width: TalebSizes.w40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace(TalebSizes.h8),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h8),
            TalebSliderImagesWidget(
              padding: EdgeInsets.symmetric(horizontal: TalebPadding.p8),
              index: 1,
              image: url,
            ),
            VerticalSpace(TalebSizes.h44),
            const LastOfferSlider(),
            VerticalSpace(TalebSizes.h44),
            VerticalSpace(TalebSizes.h44),
          ],
        ),
      ),
    );
  }
}
