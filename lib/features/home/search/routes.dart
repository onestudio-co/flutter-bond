import 'package:auto_route/auto_route.dart';

import 'news_tab_page.dart';
import 'search_tab_bar_page.dart';
import 'offers_tab_page.dart';
import 'opportunities_tab_page.dart';

const List<AutoRoute> homeSearchRoutes = <AutoRoute>[
  AutoRoute(
    page: SearchTabBarPage,
    children: [
      AutoRoute(
          page: SearchOpportunitiesPage, path: 'home-search/opportunities'),
      AutoRoute(page: SearchOffersPage, path: 'home-search/offers'),
      AutoRoute(page: SearchNewsPage, path: 'home-search/news'),
    ],
  ),
];
