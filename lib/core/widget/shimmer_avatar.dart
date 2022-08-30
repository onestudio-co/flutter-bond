import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';

class ShimmerAvatar extends StatelessWidget {
  const ShimmerAvatar({
    required this.radius,
    Key? key,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return TalebShimmer(
      child: Container(
        width: radius,
        height: radius,
        decoration: const BoxDecoration(
          color: TalebColors.softPeach,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
