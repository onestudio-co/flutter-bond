import 'package:flutter/material.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';

import '../resources/import_resources.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    required this.height,
    Key? key,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  final double height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TalebShimmer(
      highlightColor: TalebColors.ghostWhite,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: TalebColors.softPeach,
          borderRadius:
              BorderRadius.circular(borderRadius ?? TalebBorderRadius.r12),
        ),
      ),
    );
  }
}
