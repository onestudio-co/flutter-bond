library auth;

import 'package:one_studio_core/core.dart';

import 'data/models/user.dart';

export 'data/models/user.dart';
export 'data/models/user_meta.dart';
export 'data/repositories/auth_repository.dart';
export 'presentation/login/login_bloc.dart';
export 'presentation/login/login_page.dart';
export 'presentation/logout/logout_cubit.dart';
export 'presentation/register/register_bloc.dart';
export 'presentation/register/register_page.dart';
export 'routes.dart';

class Auth {
  static bool check() => sl<AuthStore<User>>().hasToken;

  static User? user() => sl<AuthStore<User>>().user;
}
