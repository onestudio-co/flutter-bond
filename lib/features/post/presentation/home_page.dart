import 'package:auto_route/auto_route.dart';
import 'package:bond/features/post/presentation/cubit/post_cubit.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_app_bar.dart';
import 'post_item.dart';

class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<PostCubit>(
          create: (context) => sl<PostCubit>()..loadAllPosts(),
        ),
      ], child: this);

  @override
  Widget build(BuildContext context) {
    final postCubit = context.watch<PostCubit>();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: postCubit.state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        success: (posts, loading) => SingleChildScrollView(
          controller: postCubit.scrollController,
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                children: posts.map((post) {
                  return PostItem(post: post);
                }).toList(),
              ),
              if (loading && posts.isEmpty)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              if (loading && posts.isNotEmpty)
                const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
        failed: (error) => Center(
          child: Text(error),
        ),
      ),
    );
  }

// void _logoutCubitListener(BuildContext context, LogoutState state) {
//   if (state is LogoutSuccess) {
//     context.router.replaceAll([const LoginRoute()]);
//   }
// }
}
