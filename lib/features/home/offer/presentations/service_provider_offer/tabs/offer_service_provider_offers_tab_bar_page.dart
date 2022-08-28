import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_avatar_image.dart';
import 'package:taleb/features/auth/data/models/user.dart';
import 'package:taleb/features/home/offer/offer_imports.dart';
import 'package:taleb/routes/app_router.dart';

import 'offers_service_provider_tab_item.dart';

class ServiceProviderOffersTabBarPage extends StatelessWidget
    implements AutoRouteWrapper {
  final User user;

  const ServiceProviderOffersTabBarPage({
    required this.user,
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
        ServiceProviderOffersDetailsTabRoute(),
        ServiceProviderOffersOffersTabRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            bottom: BottomTabBar(controller: controller, user: user),
          ),
          body: child,
        );
      },
    );
  }
}

class BottomTabBar extends StatelessWidget implements PreferredSize {
  const BottomTabBar({
    required this.controller,
    required this.user,
    Key? key,
  }) : super(key: key);

  final TabController controller;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TalebAvatarImage(
            width: TalebSizes.w80,
            height: TalebSizes.h80,
            urlImage: user.image,
            borderColor: TalebColors.greyRegular),
        VerticalSpace(TalebSizes.h8),
        Text(
          user.name,
          style: Theme.of(context).textTheme.labelMedium?.chathamsBlue,
        ),
        VerticalSpace(TalebSizes.h2),
        Text(
          user.name,
          style: Theme.of(context).textTheme.bodyLarge?.coolGrey,
        ),
        VerticalSpace(TalebSizes.h12),
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
                  title: TalebStrings.serviceProviderOffersDetailsTab),
              OfferServiceProviderTabItem(
                  title: TalebStrings.serviceProviderOffersOffersTab),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size(double.infinity, TalebSizes.h200);
}
