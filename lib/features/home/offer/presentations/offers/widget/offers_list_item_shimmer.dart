import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/core/widget/taleb_shimmer.dart';

class OffersListItemShimmer extends StatelessWidget {
  const OffersListItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TalebPadding.defaultPadding),
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (BuildContext context, int index) {
          return TalebShimmer(
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color: TalebColors.softPeach,
                  borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
                  border: Border.all(
                    color: TalebColors.softPeach,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
