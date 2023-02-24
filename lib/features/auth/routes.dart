import 'package:auto_route/annotations.dart';

import 'presentation/login/login_page.dart';
import 'presentation/register/register_page.dart';

const authRoutes = <AutoRoute>[
  AutoRoute<bool>(page: LoginPage ,initial: true),
  AutoRoute(page: RegisterPage),
];
