import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/post_cubit.dart';
import 'views/home_app_bar.dart';
import 'views/post_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

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
              if (loading) const CircularProgressIndicator.adaptive(),
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
