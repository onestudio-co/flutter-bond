import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:bond/features/auth/presentation/logout/logout_cubit.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';

class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<LogoutCubit>(
        create: (context) => sl<LogoutCubit>(),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: _logoutCubitListener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.home_page_title),
            actions: const [
              BondPopMenuButton(),
            ],
          ),
          body: const Center(
            child: Text('Home Page'),
          ),
        );
      },
    );
  }

  void _logoutCubitListener(BuildContext context, LogoutState state) {
    if (state is LogoutSuccess) {
      context.router.replaceAll([const LoginRoute()]);
    }
  }
}
