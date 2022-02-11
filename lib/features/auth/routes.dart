import 'package:auto_route/annotations.dart';
import 'package:fixit/features/auth/presentation/activation/activation_page.dart';
import 'package:fixit/features/auth/presentation/complete_registeration/complete_registeration_page.dart';
import 'package:fixit/features/auth/presentation/login/login_page.dart';
import 'package:fixit/features/auth/presentation/register/register_page.dart';
import 'package:fixit/features/auth/presentation/reset_password/reset_password_page.dart';

const authRoutes = <AutoRoute>[
  AutoRoute(page: ActivationPage),
  AutoRoute(page: CompleteProfilePage),
  AutoRoute<bool>(page: LoginPage),
  AutoRoute(page: RegistrationPage),
  AutoRoute(page: ResetPasswordPage),
];
