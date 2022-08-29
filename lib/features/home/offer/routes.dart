import 'package:auto_route/auto_route.dart';
import 'package:taleb/features/home/offer/presentations/offer_details/offer_details_page.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/tabs/details_tab_page.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/tabs/offers_tab_page.dart';
import 'package:taleb/routes/router_helpers.dart';

import 'presentations/offers/widget/filter_offers_page.dart';
import 'presentations/service_provider_offer/tabs/offer_service_provider_offers_tab_bar_page.dart';

const List<AutoRoute> offerRoutes = <AutoRoute>[
  AutoRoute(page: OfferDetailsPage),
  AutoRoute(
    page: ServiceProviderOffersTabBarPage,
    children: [
      AutoRoute(page: ServiceProviderOffersDetailsTabPage),
      AutoRoute(page: ServiceProviderOffersOffersTabPage),
    ],
  ),
  CustomRoute<int>(
    page: FilterOfferPage,
    customRouteBuilder: RouterHelpers.modalSheetBuilder,
  ),
];
