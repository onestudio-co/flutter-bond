import 'package:bond/features/collections/presentation/collections_request_provider.dart';
import 'package:bond/features/post/presentation/home_app_bar.dart';
import 'package:bond/features/post/presentation/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsPage extends HookConsumerWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsRequest = ref.watch(collectionsRequestProvider);
    final scrollController = useScrollController();
    return Scaffold(
      appBar: const HomeAppBar(),
      body: collectionsRequest.state.maybeWhen(
        success: (response) {
          final posts = response.data;
          return SingleChildScrollView(
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
              ],
            ),
          );
        },
        failure: (error) => Center(
          child: Text(error.toString()),
        ),
        loading: (_) =>
            const Center(child: CircularProgressIndicator.adaptive()),
        orElse: () => const Center(
          child: Text('No collections found.'),
        ),
      ),
    );
  }
}
