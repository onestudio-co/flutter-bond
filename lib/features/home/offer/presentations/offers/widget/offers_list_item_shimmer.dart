import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taleb/core/resources/taleb_colors.dart';

class OffersListItemShimmer extends StatelessWidget {
  const OffersListItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: .765,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: TalebColors.softPeach,
          highlightColor: TalebColors.white,
          child: Container(
            decoration: BoxDecoration(
              color: TalebColors.softPeach,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        );
      },
    );
  }
}
