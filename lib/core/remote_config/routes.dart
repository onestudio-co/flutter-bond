library intgrations_routes;

import 'package:auto_route/auto_route.dart';
import 'package:bond/core/remote_config/page/soft_update_page.dart';
import 'package:bond/core/remote_config/page/update_app_page.dart';
import 'package:bond/routes/router_helpers.dart';

export 'package:bond/core/remote_config/page/soft_update_page.dart';
export 'package:bond/core/remote_config/page/update_app_page.dart';

const List<AutoRoute> integrationsRoutes = <AutoRoute>[
  AutoRoute(
    page: UpdateAppPage,
    path: 'update_app',
  ),
  CustomRoute(
    page: SoftUpdatePage,
    customRouteBuilder: RouterHelpers.modalSheetBuilder,
  ),
];
