library auth_routes;

import 'package:auto_route/annotations.dart';

import 'presentation/login_page.dart';
import 'presentation/register_page.dart';

export 'presentation/login_page.dart';
export 'presentation/register_page.dart';

const authRoutes = <AutoRoute>[
  AutoRoute<bool>(page: LoginPage),
  AutoRoute(page: RegisterPage),
];
