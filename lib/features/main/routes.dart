import 'package:auto_route/auto_route.dart';
import 'package:bond/features/main/presentation/main_page.dart';
import 'package:bond/features/more/presentation/more_page.dart';
import 'package:bond/features/post/presentation/home_page.dart';

const mainRoutes = <AutoRoute>[
  AutoRoute(
    page: MainPage,
    initial: false,
    children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: MorePage),
    ],
  ),
];
