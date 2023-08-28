library main_routes;

import 'package:bond/features/main/presentation/main_page.dart';
import 'package:bond/features/more/presentation/more_page.dart';
import 'package:bond/features/post/presentation/cubit/post_cubit.dart';
import 'package:bond/features/post/presentation/posts_page.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final mainRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const MainPage(),
    routes: [
      GoRoute(
        path: 'home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<PostCubit>(
              create: (context) => sl<PostCubit>()..loadAllPosts(),
            ),
          ],
          child: const PostsPage(),
        ),
      ),
      GoRoute(
        path: 'more',
        builder: (context, state) => const MorePage(),
      ),
    ],
  ),
];
