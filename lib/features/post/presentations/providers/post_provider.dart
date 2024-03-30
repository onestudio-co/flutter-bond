import 'package:bond/features/post/data/api.dart';
import 'package:bond/features/post/data/models/post.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postFeatureProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, id) async {
  final api = sl<PostsApi>();
  final response = await api.fakePost();
  return response.data;
});
