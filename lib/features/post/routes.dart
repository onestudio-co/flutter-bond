library post_routes;

import 'package:go_router/go_router.dart';

import 'presentations/post_details_page.dart';

final postRoutes = [
  GoRoute(
    path: 'posts/:id',
    builder: (context, state) => PostDetailsPage(
      id: state.pathParameters['id'].toString(),
    ),
  ),
];
