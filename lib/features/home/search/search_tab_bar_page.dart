import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/tabs/offers_service_provider_tab_item.dart';
import 'package:taleb/features/home/widgets/search_widget.dart';
import 'package:taleb/routes/app_router.dart';

class SearchTabBarPage extends StatelessWidget implements AutoRouteWrapper {
  const SearchTabBarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider<ServiceProviderOfferCubit>(
        create: (context) => sl<ServiceProviderOfferCubit>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        SearchOffersRoute(),
        SearchNewsRoute(),
        SearchOpportunitiesRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: BottomTabBar(controller: controller),
          body: child,
        );
      },
    );
  }
}

class BottomTabBar extends StatelessWidget implements PreferredSize {
  const BottomTabBar({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // VerticalSpace(TalebSizes.h200),

          Row(
            children: [
              IconButton(
                onPressed: () => context.router.pop(),
                icon: const Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Expanded(
                child: SearchWidget(
                  hintText: 'ما الذي تبحث عنه ؟',
                  onChanged: (text) {},
                ),
              ),
            ],
          ),
          Container(
            height: TalebSizes.h45,
            margin: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
            padding: EdgeInsets.all(TalebPadding.p4),
            decoration: BoxDecoration(
              color: TalebColors.porcelain,
              borderRadius: BorderRadius.circular(TalebBorderRadius.r24),
            ),
            child: TabBar(
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
              unselectedLabelColor: TalebColors.coolGrey,
              labelColor: TalebColors.chathamsBlue,
              indicator: BoxDecoration(
                color: TalebColors.white,
                borderRadius: BorderRadius.circular(TalebBorderRadius.r24),
              ),
              controller: controller,
              tabs: [
                OfferServiceProviderTabItem(
                    title: TalebStrings.homeSearchOffers),
                OfferServiceProviderTabItem(title: TalebStrings.homeSearchNews),
                OfferServiceProviderTabItem(
                    title: TalebStrings.homeSearchOpportunities),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size(double.infinity, TalebSizes.h405);
}
