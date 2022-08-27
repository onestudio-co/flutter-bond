import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taleb/core/resources/taleb_colors.dart';

class TalebShimmer extends StatelessWidget {
  final Widget child;
  const TalebShimmer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TalebColors.softPeach,
      highlightColor: TalebColors.white,
      child: child,
    );
  }
}
