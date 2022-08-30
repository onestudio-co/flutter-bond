import 'package:auto_route/annotations.dart';
import 'package:taleb/features/home/home_bottom_nav_bar/home_page.dart';
import 'package:taleb/features/home/main/main_page.dart';
import 'package:taleb/features/home/news/presentations/all_news/news_page.dart';
import 'package:taleb/features/home/offer/presentations/offers/offers_page.dart';
import 'package:taleb/features/home/opportunities/presentations/all_opportunities/all_opportunities_page.dart';

const List<AutoRoute> homeBottomNavBarRoutes = <AutoRoute>[
  AutoRoute(
    path: 'home',
    page: HomePage,
    children: [
      AutoRoute(page: MainPage, path: 'main'),
      AutoRoute(page: NewsPage, path: 'news'),
      AutoRoute(page: OffersPage, path: 'offers'),
      AutoRoute(page: OpportunitiesPage, path: 'opportunities'),
    ],
  ),
];
