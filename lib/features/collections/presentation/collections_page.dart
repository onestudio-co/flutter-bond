import 'package:bond/features/collections/presentation/collections_notifier_provider.dart';
import 'package:bond/features/post/presentation/home_app_bar.dart';
import 'package:bond/features/post/presentation/post_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsPage extends HookConsumerWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListNotifier = ref.watch(itemListNotifierProvider);
    return Scaffold(
        appBar: const HomeAppBar(),
        body: ListView.builder(
          itemCount: itemListNotifier.hasMoreItems
              ? itemListNotifier.posts.data.length + 1
              : itemListNotifier.posts.data.length,
          itemBuilder: (context, index) {
            if (index == itemListNotifier.posts.data.length - 1 &&
                itemListNotifier.hasMoreItems) {
              ref.read(itemListNotifierProvider.notifier).fetchNextPage();
            }

            if (index < itemListNotifier.posts.data.length) {
              final item = itemListNotifier.posts.data[index];
              return PostItem(post: item);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
