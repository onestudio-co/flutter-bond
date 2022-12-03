import 'package:auto_route/auto_route.dart';
import 'package:bond/core/app_localizations.dart';
import 'package:bond/core/widgets/bond_pop_menu/bond_pop_menu_button.dart';
import 'package:bond/features/auth/presentation/logout/logout_cubit.dart';
import 'package:bond/features/post/presentation/cubit/post_cubit.dart';
import 'package:bond/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_studio_core/core.dart';

import 'post_item.dart';

class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<LogoutCubit>(
          create: (context) => sl<LogoutCubit>(),
        ),
        BlocProvider<PostCubit>(
          create: (context) => sl<PostCubit>()..loadPosts(),
        ),
      ], child: this);

  @override
  Widget build(BuildContext context) {
    final postCubit = context.watch<PostCubit>();
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
          body: postCubit.state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            success: (posts, loading) => Column(
              children: [
                Expanded(
                  child: GridView.count(
                    controller: postCubit.scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    children: posts.map((post) {
                      return PostItem(post: post);
                    }).toList(),
                  ),
                ),
                if (loading) const CircularProgressIndicator(),
              ],
            ),
            failed: (error) => Center(
              child: Text(error),
            ),
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
