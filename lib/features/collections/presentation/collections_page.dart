import 'package:bond/features/collections/presentation/collections_notifier_provider.dart';
import 'package:bond/features/collections/presentation/widgets/collections_list.dart';
import 'package:bond/features/post/presentation/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsPage extends HookConsumerWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final itemListResult =
        ref.watch(itemListNotifierProvider(scrollController));
    return Scaffold(
      appBar: const HomeAppBar(),
      body: itemListResult.when(
        initial: () => const CircularProgressIndicator.adaptive(),
        loading: (value) => CollectionsList(
            loading: true,
            scrollController: scrollController,
            posts: value?.data ?? []),
        success: (value) => CollectionsList(
          loading: false,
          posts: value.data,
          scrollController: scrollController,
        ),
        failure: (error) => Text('error${error.toFailure().toMessage()}'),
      ),
    );
  }
}

