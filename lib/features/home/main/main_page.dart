import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/ad/presentations/paid_ad_cubit/paid_ad_cubit.dart';
import 'package:taleb/features/home/main/last_news/cubit/last_news_cubit.dart';
import 'package:taleb/features/home/main/last_news/last_news_slider.dart';
import 'package:taleb/features/home/main/last_offers/cubit/last_offers_cubit.dart';
import 'package:taleb/features/home/main/last_offers/last_offers_slider.dart';
import 'package:taleb/features/home/main/last_opportunities/cubit/last_opportunities_cubit.dart';
import 'package:taleb/features/home/main/last_opportunities/last_opportunities_slider.dart';
import 'package:taleb/features/home/main/paid_ad/paid_ads_slider.dart';
import 'package:taleb/features/home/main/partners/partners_slider.dart';
import 'package:taleb/features/service_provider/presentations/partner_cubit/partner_cubit.dart';
import 'package:taleb/routes/app_router.dart';

class MainPage extends StatelessWidget implements AutoRouteWrapper {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<LastOffersCubit>(
            create: (BuildContext context) =>
                sl<LastOffersCubit>()..lastOffers(),
          ),
          BlocProvider<LastNewsCubit>(
            create: (BuildContext context) => sl<LastNewsCubit>()..lastNews(),
          ),
          BlocProvider<LastOpportunitiesCubit>(
            create: (BuildContext context) =>
                sl<LastOpportunitiesCubit>()..lastOpportunities(),
          ),
          BlocProvider<PartnerCubit>(
            create: (BuildContext context) => sl<PartnerCubit>()..getPartners(),
          ),
          BlocProvider<PaidAdCubit>(
            create: (BuildContext context) => sl<PaidAdCubit>()..getPaidAds(),
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
            // IconButton(
            //     onPressed: () => context.router.push(const SearchTabBarRoute()),
            //     icon: const Icon(Icons.ac_unit)),
            const PaidAdsSlider(),
            VerticalSpace(TalebSizes.h44),
            const LastOfferSlider(),
            VerticalSpace(TalebSizes.h12),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h12),
            const LastNewsSlider(),
            VerticalSpace(TalebSizes.h12),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h12),
            const LastOpportunitiesSlider(),
            VerticalSpace(TalebSizes.h12),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h12),
            const PartnerSlider(),
            VerticalSpace(TalebSizes.h12),
            VerticalSpace(TalebSizes.h44),
            VerticalSpace(TalebSizes.h44),
          ],
        ),
      ),
    );
  }
}
