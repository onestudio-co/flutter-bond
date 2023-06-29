import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const AppImage({
    required this.imageUrl,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: NetworkImage(imageUrl),
      fit: fit,
      progressIndicatorBuilder:
          OctoProgressIndicator.circularProgressIndicator(),
      errorBuilder: (_, __, ___) {
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
