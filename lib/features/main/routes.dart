library main_routes;

import 'package:bond/features/main/presentation/main_page.dart';
import 'package:bond/features/more/presentation/more_page.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../post/presentations/cubit/post_cubit.dart';
import '../post/presentations/posts_page.dart';

final mainRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainPage(body: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider<PostCubit>(
                  create: (context) => sl<PostCubit>()..loadAllPosts(),
                ),
              ],
              child: const PostsPage(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/more',
            builder: (context, state) => const MorePage(),
          ),
        ],
      ),
    ],
  ),
];
