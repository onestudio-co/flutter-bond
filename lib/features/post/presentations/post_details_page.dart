import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/post_provider.dart';
import 'views/share_button.dart';

class PostDetailsPage extends ConsumerWidget {
  const PostDetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postFeatureProvider(id));
    return postProvider.when(
      data: (post) => Scaffold(
        appBar: AppBar(
          title: Text(post.author.name),
          actions: [
            ShareButton(
              postImageUrl: post.urls.full, // Pass the post image URL
            )
          ],
        ),
        body: SizedBox(
          height: double.maxFinite,
          child: Hero(
            tag: post.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                post.urls.full,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const CircularProgressIndicator.adaptive(),
    );
  }
}
