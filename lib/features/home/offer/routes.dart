import 'package:auto_route/auto_route.dart';
import 'package:taleb/features/home/offer/presentations/offer_details/offer_details_page.dart';

import 'presentations/service_provider_offer/tabs/offer_service_provider_page.dart';

const List<AutoRoute> offerRoutes = <AutoRoute>[
  AutoRoute(page: OfferDetailsPage),
  AutoRoute(
    page: ServiceProviderOffersTabBarPage,
    children: [
      AutoRoute(page: Tab1Page),
      AutoRoute(page: Tab2Page),
    ],
  ),
];
