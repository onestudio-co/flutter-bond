import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollProvider =
    Provider.family<bool, ScrollController>((ref, scrollController) {
  ref.onDispose(scrollController.dispose);
  scrollController
      .addListener(() => scrollControllerListener(scrollController, ref));
  // default the first scroll to ensure that the scroll controller is false
  return false;
});

void scrollControllerListener(
    ScrollController scrollController, ProviderRef<bool> providerRef) {
  double maxScroll = scrollController.position.maxScrollExtent;
  double currentScroll = scrollController.position.pixels;
  double delta = 200.0;
  if (maxScroll - currentScroll <= delta) {
    providerRef.state = true;
  } else {
    providerRef.state = false;
  }
}
